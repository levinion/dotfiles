import os
import subprocess
import sys

shell = os.environ["SHELL"]


def picker(input: str):
    atuin_init_cmd = ""
    if "zsh" in shell:
        atuin_init_cmd = 'eval "$(atuin init zsh)"'
    elif "bash" in shell:
        atuin_init_cmd = 'eval "$(atuin init bash)"'
    elif "fish" in shell:
        atuin_init_cmd = "atuin init fish | source"

    output = (
        subprocess.check_output(
            [
                "zsh",
                "-c",
                f'{atuin_init_cmd} && atuin search "{input}" --cmd-only',
            ]
        )
        .strip()
        .decode()
    )

    for line in set(output.splitlines()):
        print(line)


def runner(output: str):
    subprocess.call(output, shell=True, start_new_session=True)
    input("Press any key to continue...")


def main():
    match sys.argv[1]:
        case "picker":
            picker(os.environ["FZFMENU_INPUT"])
        case "runner":
            runner(os.environ["FZFMENU_OUTPUT"])


if __name__ == "__main__":
    main()
