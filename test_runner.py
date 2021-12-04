import pathlib
import subprocess

parent = pathlib.Path(__file__).resolve().parent
executable = parent.joinpath("hw2.exe")
test_folder = parent.joinpath("tests2")
for item in test_folder.glob("*.in"):
    target_file = str(
        test_folder.joinpath(f"{item.stem}.res").relative_to(parent)
    )
    reference_file = str(
        test_folder.joinpath(f"{item.stem}.out").relative_to(parent)
    )
    args = " ".join(
        [
            str(executable.relative_to(parent)),
            "<",
            str(item.relative_to(parent)),
            ">",
            target_file,
        ]
    )
    print(args)
    subprocess.call(args, shell=True)
    subprocess.call(
        ["diff", target_file, reference_file],
        shell=True,
    )
