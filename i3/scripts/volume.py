import subprocess
import argparse


def get_id():
    return (
        subprocess.check_output(
            r"wpctl status | grep '*' | awk '{print $3}' | sed 's/\.//'",
            shell=True,
        )
        .strip()
        .decode("utf-8")
    )


def get_volume():
    return float(
        subprocess.check_output(
            rf"wpctl get-volume {get_id()} | awk '{{print $2}}'",
            shell=True,
        )
        .strip()
        .decode("utf-8")
    )


def notify_volume():
    subprocess.call(f"dunstify Volume: {get_volume()*100}%", shell=True)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("-i", "--increase", type=int)
    parser.add_argument("-d", "--decrease", type=int)
    parser.add_argument("-t", "--toggle", action=argparse.BooleanOptionalAction)
    args = parser.parse_args()

    if args.increase:
        subprocess.call(f"wpctl set-volume {get_id()} {args.increase/100}+", shell=True)
    elif args.decrease:
        if int(get_volume()) >= 100:
            pass
        elif int(get_volume()) + args.decrease / 100 >= 100:
            subprocess.call(f"wpctl set-volume {get_id()} 1", shell=True)
        else:
            subprocess.call(
                f"wpctl set-volume {get_id()} {args.decrease/100}-", shell=True
            )
    elif args.toggle:
        subprocess.call(f"wpctl set-mute {get_id()} toggle", shell=True)
    notify_volume()


if __name__ == "__main__":
    main()
