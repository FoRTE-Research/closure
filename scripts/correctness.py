#!/usr/bin/python3
import os
import subprocess
import shutil
import random
import argparse

TMP_CORPUS_DIR = "/tmp/tmp_corpus"
CORPUS_COUNT = 0

# ENV VARIABLES FOR EXPERIMENT
CLOSURE_COVERAGE_DUMP = "CLOSURE_COVERAGE_DUMP"
CLOSURE_ITERATION_COUNT = "CLOSURE_ITERATION_COUNT"
CLOSURE_INPUT_CORPUS = "CLOSURE_INPUT_CORPUS"
CLOSURE_GLOBAL_DUMP = "CLOSURE_GLOBAL_DUMP"
CLOSURE_GLOBAL_SECTION_ADDR = "CLOSURE_GLOBAL_SECTION_ADDR"
CLOSURE_GLOBAL_SECTION_SIZE = "CLOSURE_GLOBAL_SECTION_SIZE"
ITERATION_COUNT = 1000


failed_test_ids = list()

args = None


class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKCYAN = '\033[96m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


def move_corpus_to_tmp(corpus_dir_path: str):

    global CORPUS_COUNT
    try:
        os.mkdir(TMP_CORPUS_DIR)
    except FileExistsError:
        print("[ERROR]: Courpus dir already exists")
        exit(1)
    for file in os.listdir(corpus_dir_path):
        if os.path.isdir(file):
            continue
        if "id:" not in file:
            continue
        CORPUS_COUNT += 1
        id_num = os.path.relpath(file).split(",")[0].strip("id:")
        shutil.copyfile(f"{corpus_dir_path}/{file}",
                        f"{TMP_CORPUS_DIR}/id_{id_num}")


def generate_random_corpus(id: int):
    global ITERATION_COUNT

    input_corpus = list()

    while len(input_corpus) < (ITERATION_COUNT - 1):
        rand_id = random.randint(0, CORPUS_COUNT - 1)
        if (rand_id == id):
            continue
        input_corpus.append(f"{TMP_CORPUS_DIR}/id_{str(rand_id).zfill(6)}")
    input_corpus.append(f"{TMP_CORPUS_DIR}/id_{str(id).zfill(6)}")

    return input_corpus


def check_dataflow_correctness(single_dump: str, reset_dump: str, non_det_bytes: list):
    single_dump_data = open(single_dump, "rb").read()
    reset_dump_data = open(reset_dump, "rb").read()

    ret = True
    global failed_test_ids
    # non_det_bytes = list()
    incorrect_bytes = list()
    for i in range(len(single_dump_data)):
        if i in non_det_bytes:
            continue

        if (single_dump_data[i] != reset_dump_data[i]):
            incorrect_bytes.append(i)
            ret = False
    if (len(incorrect_bytes)) != 0:
        print(f"\tINCORRECT:{incorrect_bytes}")

    return ret


def check_controlflow_correctness(single_dump: str, reset_dump: str):
    single_dump_data = open(single_dump, "r").read()
    reset_dump_data = open(reset_dump, "r").read()

    single_dump_data = single_dump_data.split(",")
    reset_dump_data = reset_dump_data.split(",")
    return reset_dump_data == single_dump_data


def determine_nondeterministic_bytes(id: int):

    # How many iterations should we do to determine non-det bytes?
    # We start with 10

    non_det_bytes = list()
    copy_cmdline = args.cmdline.split(" ")
    single_env = generate_envs(args, True, id, id)

    for it in range(0, 10):

        run_target(cmdline=copy_cmdline, env=single_env)
        first_dump = open(single_env[CLOSURE_GLOBAL_DUMP], "rb").read()
        os.unlink(single_env[CLOSURE_GLOBAL_DUMP])
        single_env[CLOSURE_GLOBAL_DUMP] = single_env[CLOSURE_GLOBAL_DUMP].replace(
            "single", "reset")
        run_target(cmdline=copy_cmdline, env=single_env)
        second_dump = open(single_env[CLOSURE_GLOBAL_DUMP], "rb").read()
        os.unlink(single_env[CLOSURE_GLOBAL_DUMP])

        for i in range(len(first_dump)):
            if first_dump[i] != second_dump[i]:
                non_det_bytes.append(i)
                non_det_bytes.append(i+1)
                non_det_bytes.append(i-1)

    non_det_bytes = [*set(non_det_bytes)]

    print(f"\tNON DET: {non_det_bytes}")
    return non_det_bytes


def parse_cov_file(cov_file_path: str):
    f = open(cov_file_path)

    cov_data = f.read()
    return cov_data.split(",")


def run_target(cmdline: str, env: dict):
    run = subprocess.run(
        cmdline, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, env=env)


def generate_envs(args: argparse.Namespace, ground_truth_run: bool, id: int, input_corpus=None):

    reset_dump_file = f"{os.path.join(os.getcwd(),f'reset_dump_{id}')}"
    single_dump_file = f"{os.path.join(os.getcwd(),f'single_dump_{id}')}"

    env = os.environ.copy()
    if ground_truth_run:
        env[CLOSURE_ITERATION_COUNT] = str(1)
        env[CLOSURE_INPUT_CORPUS] = f"{TMP_CORPUS_DIR}/id_{str(input_corpus).zfill(6)}"
        if args.dataflow_correctness:
            env[CLOSURE_GLOBAL_DUMP] = single_dump_file
        else:
            env[CLOSURE_COVERAGE_DUMP] = single_dump_file
    else:
        env[CLOSURE_ITERATION_COUNT] = str(ITERATION_COUNT)
        env[CLOSURE_INPUT_CORPUS] = ",".join(input_corpus)
        if args.dataflow_correctness:
            env[CLOSURE_GLOBAL_DUMP] = reset_dump_file
        else:
            env[CLOSURE_COVERAGE_DUMP] = reset_dump_file

    if args.global_section_addr:
        env[CLOSURE_GLOBAL_SECTION_ADDR] = str(args.global_section_addr)
    if args.global_section_size:
        env[CLOSURE_GLOBAL_SECTION_SIZE] = str(args.global_section_size)

    return env


def main():

    global args

    parser = argparse.ArgumentParser(prog="Correctness Experiment script")
    parser.add_argument("-x", dest="corpus_dir", required=True,
                        help="Provide absolute path of corpus to test")

    parser.add_argument("-cmdline", dest="cmdline",
                        required=True, help="Command line for the target. Provide @@ at input file")

    parser.add_argument("-i", dest="id", required=False, type=int)
    parser.add_argument("-addr", dest="global_section_addr",
                        required=False, type=int)
    parser.add_argument("-size", dest="global_section_size",
                        required=False, type=int)
    parser.add_argument("-d", dest="dataflow_correctness",
                        required=False, action="store_true")

    if (os.path.exists(TMP_CORPUS_DIR)):
        print("[INFO]: TMP Corpus path exists, deleting it")
        shutil.rmtree(TMP_CORPUS_DIR)

    args = parser.parse_args()
    move_corpus_to_tmp(args.corpus_dir)

    corpus_range = range(CORPUS_COUNT)

    if args.id:
        corpus_range = [args.id]

    cmdline: list = args.cmdline.split(" ")

    for i in corpus_range:
        print(
            f" {bcolors.OKCYAN}[INFO]: Testing for Corpus ID {i} {bcolors.ENDC}")

        non_det_bytes = list()
        if args.dataflow_correctness:
            non_det_bytes = determine_nondeterministic_bytes(i)

        # Running single iteration for ground truth
        copy_cmdline = args.cmdline.split(" ")
        single_env = generate_envs(args, True, i, i)
        run_target(cmdline=copy_cmdline, env=single_env)

        # Running n number of iterations to get reset data

        input_corpus = generate_random_corpus(i)
        reset_env = generate_envs(args, False, i, input_corpus)

        run_target(cmdline=cmdline, env=reset_env)

        if args.dataflow_correctness:

            if check_dataflow_correctness(
                    single_dump=single_env[CLOSURE_GLOBAL_DUMP],
                    reset_dump=reset_env[CLOSURE_GLOBAL_DUMP],
                    non_det_bytes=non_det_bytes) is False:
                print(
                    f"{bcolors.FAIL} [WARN]: Failed test for {i} {bcolors.ENDC}")
                failed_test_ids.append(f"id_{str(i).zfill(6)}")

        else:
            if check_controlflow_correctness(
                single_dump=single_env[CLOSURE_COVERAGE_DUMP],
                reset_dump=reset_env[CLOSURE_COVERAGE_DUMP]
            ) is False:
                print(
                    f"{bcolors.FAIL} [WARN]: Failed controlflow test for {i} {bcolors.ENDC}")
                failed_test_ids.append(f"id_{str(i).zfill(6)}")

        # if (single_cov != reset_cov):
        #     print(
        #         f"{bcolors.WARNING}[WARN]: Failed test for Corpus ID: {i}{bcolors.ENDC}")
        #     print(f"{len(reset_cov)} : {len(single_cov)}")
        #     print(f"{single_cov}\n\n {reset_cov}")
        if args.dataflow_correctness:
            os.unlink(single_env[CLOSURE_GLOBAL_DUMP])
            os.unlink(reset_env[CLOSURE_GLOBAL_DUMP])
        else:
            os.unlink(single_env[CLOSURE_COVERAGE_DUMP])
            os.unlink(reset_env[CLOSURE_COVERAGE_DUMP])

    print(
        f"{bcolors.WARNING} [RESULT]: Failed test for {failed_test_ids} {bcolors.ENDC}")


if __name__ == "__main__":
    main()
