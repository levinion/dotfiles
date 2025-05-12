import os
import tomllib


def read_config():
    with open("config.toml", "rb") as f:
        return tomllib.load(f)


def ask(message: str) -> bool:
    res = input(message + " [y/n]")
    if res == "y" or res == "":
        return True
    return False


def setup_softlink(config):
    for src, dst in config["softlink"].items():
        if dst == "":
            dst = "~/.config/"
        dst = os.path.expanduser(dst)
        target = os.path.join(dst, src)
        if os.path.exists(target):
            if ask(f"{target} exists. Are you sure to remove it?"):
                os.system(f"rm -rf {target}")
            else:
                print("skip creating softlink...")
                return
    os.system("stow .")


def setup_dependicies(config):
    aur_helper: str = config["dependencies"]["aur_helper"]
    packages: list[str] = config["dependencies"]["packages"]
    os.system(f"{aur_helper} -S --needed {" ".join(packages)}")


def main():
    config = read_config()
    setup_dependicies(config)
    setup_softlink(config)


if __name__ == "__main__":
    main()
