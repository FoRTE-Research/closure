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

#define DEFAULT_COMPILER "/usr/lib/llvm-11/bin/clang"

#define RED   "\x1B[31m"
#define GRN   "\x1B[32m"
#define YEL   "\x1B[33m"
#define BLU   "\x1B[34m"
#define MAG   "\x1B[35m"
#define CYN   "\x1B[36m"
#define WHT   "\x1B[37m"
#define RESET "\x1B[0m"

using namespace std;

bool closure_cov = false;

string closure_path;

string correctness_stub;
string closure_pass;
string correctness_stub_object_path;

string coverage_pc_guard_callback_path;
string coverage_pc_guard_object_path;

void setup_cmdline_args() {
    struct passwd* pw   = getpwuid(getuid());
    const char* homedir = pw->pw_dir;

    // Setting up closure related paths
    closure_path = homedir;

    closure_path.append("/projects/closure");
    correctness_stub             = closure_path + "/instrumentation/tools/src/dataflow-correctness-stub.c";
    closure_pass                 = closure_path + "/build/libclosure.so";
    correctness_stub_object_path = closure_path + "/correctness-experiment/dataflow-correctness-stub.o";

    coverage_pc_guard_callback_path = closure_path + "/correctness-experiment/coverage-pc-guard.c";
    coverage_pc_guard_object_path   = closure_path + "/correctness-experiment/coverage-pc-guard.o";
}

vector<string> make_argv_copy(int argc, char** argv) {
    vector<string> argv_copy;

    for (size_t i = 0; i < argc; ++i) {
        argv_copy.push_back(argv[i]);
    }
    return argv_copy;
}

char** make_envp_copy(char** envp) {
    char** envp_it = envp;
    int siz        = 0;
    while (*envp_it) {
        siz++;
        *envp_it++;
    }
    char** envp_copy = (char**)malloc(sizeof(char*) * (siz + 1));
    envp_it          = envp;
    int i            = 0;
    while (*envp_it) {
        envp_copy[i] = *envp_it;
        ++i;
        *envp_it++;
    }
    envp_copy[siz] = NULL;
    return envp_copy;
}

void compile_pc_guard_obj(string compiler) {
    char** cmd = (char**)(malloc(sizeof(char*) * 8));
    cmd[0]     = (char*)compiler.c_str();
    cmd[1]     = (char*)"-fPIC";
    cmd[2]     = (char*)"-c";
    cmd[3]     = (char*)coverage_pc_guard_callback_path.c_str();
    cmd[4]     = (char*)"-o";
    cmd[5]     = (char*)coverage_pc_guard_object_path.c_str();
    cmd[6]     = (char*)"-g";
    cmd[7]     = NULL;

    pid_t pid = fork();
    if (pid == 0) {
        // Child process
        // We are in the child process, close its stdout and stderr
        close(STDOUT_FILENO);
        close(STDERR_FILENO);
        int devNullfd = open("/dev/null", O_RDWR);
        dup2(devNullfd, 1);
        dup2(devNullfd, STDERR_FILENO);

        execve(compiler.c_str(), cmd, NULL);
        // Failed to Execve!!
        exit(1);
    }
    else {
        int status;

        int ret = waitpid(pid, &status, 0);
        if (WIFEXITED(status)) {
            int exit_status = WEXITSTATUS(status);
            if (exit_status != 0) {
                printf(RED "Failed to compile trace-pc-guard.c " RESET "\n");
                exit(1);
            }
        }
    }
}

void compile_closure_stub_obj(string compiler) {
    char** cmd = (char**)(malloc(sizeof(char*) * 7));
    cmd[0]     = (char*)compiler.c_str();
    cmd[1]     = (char*)"-c";
    cmd[2]     = (char*)correctness_stub.c_str();
    cmd[3]     = (char*)"-o";
    cmd[4]     = (char*)correctness_stub_object_path.c_str();
    cmd[5]     = (char*)"-g";
    cmd[6]     = NULL;

    pid_t pid = fork();
    if (pid == 0) {
        // Child process
        // We are in the child process, close its stdout and stderr
        close(STDOUT_FILENO);
        close(STDERR_FILENO);
        int devNullfd = open("/dev/null", O_RDWR);
        dup2(devNullfd, 1);
        dup2(devNullfd, STDERR_FILENO);

        execve(compiler.c_str(), cmd, NULL);
        // Failed to Execve!!
        exit(1);
    }
    else {
        int status;

        int ret = waitpid(pid, &status, 0);
        if (WIFEXITED(status)) {
            int exit_status = WEXITSTATUS(status);
            if (exit_status != 0) {
                printf(RED "Failed to compile trace-pc-guard.c " RESET "\n");
                exit(1);
            }
        }
    }
}

int main(int argc, char** argv, char** envp) {
    printf(BLU "Correctness Compiler" RESET "\n");

    setup_cmdline_args();
    auto argv_copy = make_argv_copy(argc, argv);

    auto envp_copy = make_envp_copy(envp);

    bool compile_command = false;

    string compiler = DEFAULT_COMPILER;

    for (size_t i = 0; i < argc; ++i) {
        std::string arg(argv[i]);
        if (arg == "-closure") {
            closure_cov = true;
            argv_copy.erase(argv_copy.begin() + i);
        }
        if (arg.find(".o") != string::npos || arg.find(".c") != string::npos) {
            compile_command = true;
        }
    }

    argv_copy[0] = compiler;

    // compile_pc_guard_obj(compiler);

    if (compile_command != false) {
        string optimization_opt = "-O3";
        argv_copy.push_back(optimization_opt);
        string new_pm_str = "-fexperimental-new-pass-manager";
        argv_copy.push_back(new_pm_str);

        string pass_plugin_str = "-fpass-plugin=";
        pass_plugin_str.append(closure_pass);
        argv_copy.push_back(pass_plugin_str);

        // argv_copy.push_back("-fsanitize-coverage=trace-pc-guard");
    }

    char** exec_argv = (char**)malloc(sizeof(char*) * (argv_copy.size() + 1));
    int i            = 0;
    for (auto arg : argv_copy) {
        exec_argv[i] = (char*)malloc(sizeof(char) * arg.size() + 1);
        strncpy(exec_argv[i], arg.c_str(), arg.size());
        exec_argv[i][arg.size()] = '\x00';
        ++i;
    }
    exec_argv[i] = NULL;
    pid_t pid    = fork();

    if (pid == 0) {
        // We are in the child process, close its stdout and stderr
        close(STDOUT_FILENO);
        close(STDERR_FILENO);
        int devNullfd = open("/dev/null", O_RDWR);
        dup2(devNullfd, 1);
        dup2(devNullfd, STDERR_FILENO);

        execve(compiler.c_str(), exec_argv, envp_copy);
        exit(0);
    }
    else {
        int status;

        int ret = waitpid(pid, &status, 0);
        if (WIFEXITED(status)) {
            int exit_status = WEXITSTATUS(status);
            if (exit_status == 1) {
                compile_closure_stub_obj(compiler);
                // argv_copy.push_back(coverage_pc_guard_object_path);
                argv_copy.push_back(correctness_stub_object_path);
            }
            int i           = 0;
            char** new_argv = (char**)malloc(sizeof(char*) * (argv_copy.size() + 1));
            for (auto arg : argv_copy) {
                new_argv[i] = (char*)malloc(sizeof(char) * arg.size() + 1);
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
