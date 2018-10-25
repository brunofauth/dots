import shutil
import fire
import os


def copytreebetter(src_dir, dest_dir):
    for dirpath, dirnames, filenames in os.walk(src_dir):
        this_dir = os.path.relpath(dirpath, src_dir)
        remote_subdir = os.join(dest_dir, this_dir) 
        if not os.path.isdir(remote_subdir):
            os.mkdir(remote_subdir)
        for file in filenames:
            our_file = os.path.join(dirpath, file)
            out_file = os.path.join(remote_subdir, file)
            shutil.copyfile(our_file, out_file)


def main(theme):
    themes = os.listdir("./themes")
    if theme not in themes:
        raise ValueError(f"Theme must be one of {themes}")
    this_dir = os.path.dirname(os.path.abspath(__file__))
    general_dir = os.path.join(this_dir, "general")
    theme_dir = os.path.join(this_dir, theme)
    copytreebetter(general_dir, os.environ["HOME"])
    copytreebetter(theme_dir, os.environ["HOME"])


if __name__ == "__main__":
    fire.Fire(main)
