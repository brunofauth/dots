import fire
import os

def main(schemes, outdir):
    with open(schemes) as src:
        lines = src.readlines()
    for x in range(0, 19*6, 5):
        print(lines[x])
        with open(os.path.join(outdir, lines[x].split('"')[1]), "w") as file:
            file.write(";; Begin Active Colors\n")
            for y in range(1, 5):
                file.write(lines[x + y].split("/")[2]+ "\n")
            file.write(";; End Active Colors\n")


if __name__ == "__main__":
    fire.Fire(main)
