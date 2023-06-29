import matplotlib.pyplot as plt

coverage_improvement = [10, 1.18, 0, 3.08, 3.8,
                        0.83, 0.43, 1.31, 10, 10, 1.34, -0.47, 0.29, 1.9, 2, 0.41, 0.54, 0.04]
exec_ratio = [3.5, 1.06, 3.58, 2.18, 2.72,
              3.81, 2.71, 3.54, 2.13, 2.58, 3.6, 3.01, 1.71, 3.65, 2.64, 3.33, 3.06, 1.92]

benchmarks = ["bsdtar", "nasm", "cJSON", "xmllint", "freetype", "pngfix",
              "json-parser", "giftext", "gpmf-parser", "libpcap", "zlib", "c-blosc2", "cgif", "libbpf", "libdwarf", "lighttpd", "oniguruma", "md4c"]

plt.scatter(coverage_improvement, exec_ratio)

plt.xlabel("Coverage Improvement (% increase)")
plt.ylabel("Exec speedup")

plt.xticks(ticks=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], labels=[
           "0%", "1%", "2%", "3%", "4%", "5%", "6%", "7%", "8%", "9%", ">10%"])

plt.plot([0, 0], [0, 4], linestyle="--", color="C1")

for x, y, label in zip(coverage_improvement, exec_ratio, benchmarks):
    plt.annotate(label,  # this is the text
                 (x, y),  # these are the coordinates to position the label
                 textcoords="offset points",  # how to position the text
                 xytext=(0, 10),  # distance from text to points (x,y)
                 ha='center')

plt.show()
