import i3ipc
import argparse

i3 = i3ipc.Connection()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("action")
    parser.add_argument("position")
    args = parser.parse_args()

    focused = i3.get_tree().find_focused()
    if focused is None:
        return
    workspace = focused.workspace()
    if workspace is None:
        return
    index = workspace.ipc_data["num"]

    run(args.action, args.position, index)
    clean_empty_workspace()


def run(action: str, position: str, index: int):
    match action:
        case "move":
            move(position, index)
        case "move_container":
            move_container(position, index)
        case _:
            return


def move(position: str, index: int):
    match position:
        case "left":
            if index == 1:
                return
            i3.command(f"workspace {index-1}")
        case "right":
            i3.command(f"workspace {index+1}")
        case _:
            return


def move_container(position: str, index: int):
    match position:
        case "left":
            if index == 1:
                return
            i3.command(f"move container to workspace {index-1}, workspace {index-1}")
        case "right":
            i3.command(f"move container to workspace {index+1}, workspace {index+1}")
        case _:
            return


def clean_empty_workspace():
    fix_ordering(i3)


# check if workspaces are all in order
def workspaces_ordered(i3conn):
    last_workspace = 0
    for i in sorted(i3conn.get_workspaces(), key=lambda x: x.num):
        number = int(i.num)
        if number != last_workspace + 1:
            return False
        last_workspace += 1
    return True


# find all the workspaces that are out of order and
# the least possible valid workspace number that is unassigned
def find_disordered(i3conn):
    disordered = []
    least_number = None
    workspaces = sorted(i3conn.get_workspaces(), key=lambda x: x.num)
    occupied_workspaces = [int(x.num) for x in workspaces]
    last_workspace = 0
    for i in workspaces:
        number = int(i.num)
        if number != last_workspace + 1:
            disordered.append(number)
            if least_number is None and last_workspace + 1 not in occupied_workspaces:
                least_number = last_workspace + 1
        last_workspace += 1
    return (disordered, least_number)


# renumber all the workspaces that appear out of order from the others
def fix_ordering(i3conn):
    if workspaces_ordered(i3conn):
        return
    else:
        workspaces = i3conn.get_tree().workspaces()
        disordered_workspaces, least_number = find_disordered(i3conn)
        if least_number is None:
            print("least_number is none")
            return
        containers = list(filter(lambda x: x.num in disordered_workspaces, workspaces))
        target = least_number
        for c in containers:
            for i in c.leaves():
                i.command(f"move container to workspace {least_number}")
            least_number += 1
        i3.command(f"workspace {target}")
    return


if __name__ == "__main__":
    main()
