#include <fcntl.h>
#include <getopt.h>
#include <iostream>
#include <malloc.h>
#include <pwd.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <string>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#include <vector>

#define DEFAULT_COMPILER "/usr/bin/clang"

#define RED "\x1B[31m"
#define GRN "\x1B[32m"
#define YEL "\x1B[33m"
#define BLU "\x1B[34m"
#define MAG "\x1B[35m"
#define CYN "\x1B[36m"
#define WHT "\x1B[37m"
#define RESET "\x1B[0m"

using namespace std;

bool no_fuzz = false;
bool global_overhead_exp = false;

string closure_path;
string afl_path;

string closure_stub_no_fuzz;
string closure_stub_afl;
string closure_stub_global_overhead;
string closure_pass;

string afl_clang_fast;
string denylist;

void setup_cmdline_args()
{
    struct passwd *pw = getpwuid(getuid());
    const char *homedir = pw->pw_dir;

    // Setting up closure related paths
    closure_path = homedir;

    closure_path.append("/projects/closure");
    closure_stub_no_fuzz = closure_path + "/instrumentation/tools/src/stubMain.c";
    closure_stub_afl = closure_path + "/instrumentation/tools/src/stubMainAFL.c";
    closure_stub_global_overhead = closure_path + "/instrumentation/tools/src/stubMainGlobalExperiment.c";

    closure_pass = closure_path + "/build/libclosure.so";

    denylist = closure_path + "/denylist.txt";

    afl_path = homedir;
    afl_path.append("/projects/AFLplusplus");
    afl_clang_fast = afl_path + "/afl-clang-fast";
}

vector<string> make_argv_copy(int argc, char **argv)
{
    vector<string> argv_copy;

    for (size_t i = 0; i < argc; ++i)
    {
        argv_copy.push_back(argv[i]);
    }
    return argv_copy;
}

char **make_envp_copy(char **envp)
{
    char **envp_it = envp;
    int siz = 0;
    while (*envp_it)
    {
        siz++;
        *envp_it++;
    }
    char **envp_copy = (char **)malloc(sizeof(char *) * (siz + 2));
    envp_it = envp;
    int i = 0;
    while (*envp_it)
    {
        envp_copy[i] = *envp_it;
        ++i;
        *envp_it++;
    }
    char *s = (char *)malloc(sizeof(char) * (denylist.size() + strlen("AFL_LLVM_DENYLIST=")));
    sprintf(s, "AFL_LLVM_DENYLIST=%s", &denylist[0]);
    envp_copy[siz] = s;
    envp_copy[siz + 1] = NULL;
    return envp_copy;
}

int main(int argc, char **argv, char **envp)
{

    printf(GRN "Closure - Compiler instrumentation for automated persistent mode" RESET "\n");

    setup_cmdline_args();
    auto argv_copy = make_argv_copy(argc, argv);

    auto envp_copy = make_envp_copy(envp);

    bool compile_command = false;

    string compiler = afl_clang_fast;

    for (size_t i = 0; i < argc; ++i)
    {
        std::string arg(argv[i]);
        if (arg == "-no-fuzz")
        {
            compiler = DEFAULT_COMPILER;
            no_fuzz = true;
            argv_copy.erase(argv_copy.begin() + i);
        }
        if (arg == "-global-bytes")
        {
            compiler = DEFAULT_COMPILER;
            global_overhead_exp = true;
            argv_copy.erase(argv_copy.begin() + i);
        }
        if (arg.find(".o") != string::npos || arg.find(".c") != string::npos)
        {
            compile_command = true;
        }
    }

    if (global_overhead_exp && no_fuzz)
    {
        printf(RED "Usage: -no-fuzz and -global-bytes cannot be used together" RESET "\n");
        exit(1);
    }

    argv_copy[0] = compiler;

    if (compile_command != false)
    {
        // Push closure related flags int oargv
        argv_copy.push_back("-Xclang");
        argv_copy.push_back("-load");
        argv_copy.push_back("-Xclang");
        argv_copy.push_back(closure_pass);
    }

    char **exec_argv = (char **)malloc(sizeof(char *) * (argv_copy.size() + 1));
    int i = 0;
    for (auto arg : argv_copy)
    {
        exec_argv[i] = (char *)malloc(sizeof(char) * arg.size() + 1);
        strncpy(exec_argv[i], arg.c_str(), arg.size());
        exec_argv[i][arg.size()] = '\x00';
        ++i;
    }
    exec_argv[i] = NULL;
    pid_t pid = fork();

    if (pid == 0)
    {
        // We are in the child process close its stdout and stderr
        close(STDOUT_FILENO);
        close(STDERR_FILENO);
        int devNullfd = open("/dev/null", O_RDWR);
        dup2(devNullfd, 1);
        dup2(devNullfd, STDERR_FILENO);

        execve(compiler.c_str(), exec_argv, envp_copy);
        exit(0);
    }
    else
    {

        int status;

        int ret = waitpid(pid, &status, 0);
        if (WIFEXITED(status))
        {
            int exit_status = WEXITSTATUS(status);
            if (exit_status == 1)
            {

                if (no_fuzz)
                    argv_copy.push_back(closure_stub_no_fuzz);
                else if (global_overhead_exp)
                    argv_copy.push_back(closure_stub_global_overhead);
                else
                    argv_copy.push_back(closure_stub_afl);
            }
            int i = 0;
            char **new_argv = (char **)malloc(sizeof(char *) * (argv_copy.size() + 1));
            for (auto arg : argv_copy)
            {
                new_argv[i] = (char *)malloc(sizeof(char) * arg.size() + 1);
                strncpy(new_argv[i], arg.c_str(), arg.size());
                new_argv[i][arg.size()] = '\x00';
                ++i;
            }
            new_argv[i] = NULL;

            execve(compiler.c_str(), new_argv, envp_copy);
        }
    }

    return 0;
}
