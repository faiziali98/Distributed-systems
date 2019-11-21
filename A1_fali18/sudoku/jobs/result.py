
file_name = "slurm-98596{}.out"
lst = ["", "", "", "", ""]

for i, x in enumerate(range(5,10)):
    # print(i)
    with open(file_name.format(x), "r") as f:
        for line in f.readlines():
            if (line.__contains__("Elapsed")):
                spl = line.strip().split(" ")
                lst[i] += spl[2] + ","
                # print ()

## lst = [r.strip(",") for r in lst]

with open("parta_diff_grid_s.txt", "w") as f:
    for r in lst:
        f.write(r.strip(",")+"\n")

print(lst)