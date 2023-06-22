import matplotlib.pyplot as plt

coverage_improvement = [52.17, 1.18, 0, 3.08, 3.8, 0.83, 0.43, 1.32, 14.39, 55.32, 1.34, -0.47]
exec_ratio = [3.5, 1.06, 3.58, 2.18, 2.72, 3.81, 2.71, 3.54, 2.13, 2.58, 3.57, 3.01]

benchmarks = ["bsdtar", "nasm", "cJSON", "xmllint", "freetype", "pngfix", "json-parser", "giftext", "gpmf-parser", "libpcap", "zlib", "c-blosc2"]

plt.scatter(coverage_improvement, exec_ratio)

plt.xlabel("Coverage Improvement (% increase)")
plt.ylabel("Exec speedup")

plt.xticks([0, 5, 10, 20, 30, 40, 50])

plt.plot([0,0], [0, 4], linestyle="--", color="C1")

for x, y, label in zip(coverage_improvement, exec_ratio, benchmarks):
    plt.annotate(label, # this is the text
                 (x,y), # these are the coordinates to position the label
                 textcoords="offset points", # how to position the text
                 xytext=(0,10), # distance from text to points (x,y)
                 ha='center')

plt.show()