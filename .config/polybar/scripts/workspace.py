import i3ipc

active = ""
inactive = ""


def main():
    i3 = i3ipc.Connection()
    focused = i3.get_tree().find_focused()
    if focused is None:
        return
    current = focused.workspace()
    if current is None:
        return
    index = current.ipc_data["num"]
    max_index = max(index, len(i3.get_workspaces()))
    f_list = []
    for i in range(1, max_index + 1):
        if i == index:
            f_list.append(f"{index} {active}")
        else:
            f_list.append(f"{inactive}")
    output = "  ".join(f_list)
    print(output)


if __name__ == "__main__":
    main()
