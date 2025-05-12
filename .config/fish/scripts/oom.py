#!/bin/python3
import subprocess
import os
import time
import sys


def get_pid_by_name(name):
    return int(
        subprocess.check_output(["bash", "-c", f"pidof {name}"]).strip().decode()
    )


def get_memory_by_pid(pid):
    return int(
        subprocess.check_output(
            ["bash", "-c", f"pmap -x {pid} | awk '/total/ {{print $3}}'"]
        )
    )


def run(command):
    with open(os.devnull) as devnull:
        subprocess.Popen(
            command,
            stdout=devnull,
            stderr=devnull,
        )


def main():
    command = " ".join(sys.argv[1:])
    print(command)
    while 1:
        pid = None
        try:
            pid = get_pid_by_name(command)
        except subprocess.CalledProcessError:
            run(["bash", "-c", command])
            time.sleep(5)
            pid = get_pid_by_name(command)
        assert pid is not None
        memory = get_memory_by_pid(pid)
        if memory >= 32 * 1024 * 1024:
            os.kill(pid, 9)
            run(["bash", "-c", command])
        time.sleep(10)


if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        exit(0)
