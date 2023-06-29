import numpy as np
import matplotlib.pyplot as plt

benchmarks = ["bsdtar", "nasm", "cJSON", "xmllint", "freetype", "pngfix",
              "json-parser", "giftext", "gpmf-parser", "libpcap", "zlib", "c-blosc2",
              "cgif", "libbpf", "libdwarf", "lighttpd", "oniguruma", "md4c"]

afl_data_exec = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
closure_data_exec = [3.5, 1.06, 3.58, 2.18, 2.72,
                     3.81, 2.71, 3.54, 2.13, 2.58, 3.57, 3.01,
                     1.71, 3.65, 2.64, 3.33, 3.06, 1.92]

closure_data_cov = [1.52, 1.011, 1, 1.03, 1.038, 1.008,
                    1.004, 1.0132, 1.143, 1.553, 1.013, 0.99, 1.002, 1.01, 1.02, 1.0041, 1.0054, 1.0004]


closure_data_corpus = [1.661495367, 1.04, 1.06, 0.955,
                       1.08, 1.05, 1.06, 0.56, 1.11, 1.45, 1.11, 1.032,
                       1.009, 1.06, 1.09, 0.98, 1.03, 1.011]


sum = 0

for i in closure_data_exec:
    sum += i

print(f"Average exec speedup {sum/len(benchmarks)}")
closure_data_exec.append(sum/len(benchmarks))

sum = 0
for i in closure_data_cov:
    sum += i
print(f"Average cov increase {sum/len(benchmarks)}")
closure_data_cov.append(sum/len(benchmarks))

sum = 0
for i in closure_data_corpus:
    sum += i
print(f"Average corpus increase {sum/len(benchmarks)}")
closure_data_corpus.append(sum/len(benchmarks))

afl_data_exec.append(1)
benchmarks.append("average")

X_axis = np.arange(len(benchmarks))

if False:
    plt.bar(X_axis - 0.2, afl_data_exec, 0.4, label='AFL++')
    plt.bar(X_axis + 0.2, closure_data_exec, 0.4, label='Closure')

    plt.xticks(X_axis, benchmarks)
    plt.xlabel("Benchmarks")
    plt.ylabel("Relative Exec Speed ")
    plt.title("Execution speedup for each benchmark")
    plt.legend()
elif False:
    plt.bar(X_axis - 0.2, afl_data_exec, 0.4, label='AFL++')
    plt.bar(X_axis + 0.2, closure_data_cov, 0.4, label='Closure')

    plt.xticks(X_axis, benchmarks)
    plt.xlabel("Benchmarks")
    plt.ylabel("Relative Code Coverage ")
    plt.title("Relative code coverage for each benchmark")
    plt.legend()
else:
    plt.bar(X_axis - 0.2, afl_data_exec, 0.4, label='AFL++')
    plt.bar(X_axis + 0.2, closure_data_cov, 0.4, label='Closure')

    plt.xticks(X_axis, benchmarks)
    plt.xlabel("Benchmarks")
    plt.ylabel("Relative Corpus Size ")
    plt.title("Relative corupus size for each benchmark")
    plt.legend()


plt.show()
