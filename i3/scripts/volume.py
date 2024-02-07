import subprocess
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("-i", "--increase", type=int)
parser.add_argument("-d", "--decrease", type=int)
parser.add_argument("-t", "--toggle", action=argparse.BooleanOptionalAction)
args = parser.parse_args()

if args.increase:
    subprocess.call(f"pamixer --increase {args.increase}", shell=True)
    subprocess.call("dunstify Volume: $(pamixer --get-volume-human)", shell=True)
elif args.decrease:
    subprocess.call(f"pamixer --decrease {args.decrease}", shell=True)
    subprocess.call("dunstify Volume: $(pamixer --get-volume-human)", shell=True)
elif args.toggle:
    subprocess.call("pamixer --toggle-mute", shell=True)
    subprocess.call("dunstify Volume: $(pamixer --get-volume-human)", shell=True)
