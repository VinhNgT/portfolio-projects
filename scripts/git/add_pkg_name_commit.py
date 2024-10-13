import re
import subprocess
import sys

PACKAGE_DIRS = [
    "melos_workspace/apps",
]

PACKAGE_NAME_SHORT = {
    "driving_license": "drv_lcn",
    "e_commerce": "e_com",
}

DEBUG_PRINT = False


def setup_global_vars():
    global COMMIT_MSG_FILE
    global COMMIT_SOURCE
    global SHA1

    # Check that the correct number of arguments was provided
    if len(sys.argv) != 4:
        print("Usage: add_package_name.py COMMIT_MSG_FILE COMMIT_SOURCE SHA1")
        sys.exit(1)

    # Read the command-line arguments
    COMMIT_MSG_FILE = sys.argv[1]
    COMMIT_SOURCE = sys.argv[2]
    SHA1 = sys.argv[3]


def check_conventional_commit(commit_message):
    # Check if the commit message follows the conventional commit format
    # https://www.conventionalcommits.org/en/v1.0.0/
    if not commit_message:
        return False

    lines = commit_message.splitlines()
    if len(lines) < 1:
        return False

    first_line = lines[0]
    if not first_line:
        return False

    parts = first_line.split(":")
    if len(parts) < 2:
        return False

    return True


def add_package_name(commit_message: str, package_names: list[str]) -> str:
    parts = commit_message.split(":", 1)
    commit_type = parts[0].strip()
    commit_type += "(" + ", ".join(package_names) + "):"
    return commit_type + parts[1]


def check_package_name_existed(commit_message: str) -> bool:
    parts = commit_message.split(":", 1)
    commit_type = parts[0].strip()
    match = re.search(r"\((.*?)\)", commit_type)

    if not match:
        return False

    return True


def remove_existing_package_name(commit_message: str) -> str:
    parts = commit_message.split(":", 1)
    commit_type = parts[0].strip()
    match = re.search(r"\((.*?)\)", commit_type)

    if not match:
        return commit_message

    commit_type = commit_type.replace(match.group(0), "")
    return commit_type + ":" + parts[1]


def get_pkg_names_from_dir(paths: list[str], dir: str) -> set[str]:
    if not dir.endswith("/"):
        dir += "/"

    paths_in_pkg_dir = filter(lambda x: x.startswith(dir), paths)
    paths_in_pkg_dir_without_dir = map(
        lambda x: x[len(dir) :] if x.startswith(dir) else x, paths_in_pkg_dir
    )

    pkg_entries = set()
    for path in paths_in_pkg_dir_without_dir:
        parts = path.split("/")
        if len(parts) > 1:
            pkg_entries.add(parts[0])

    return pkg_entries


def main():
    if DEBUG_PRINT:
        print("Adding package name to commit message...")

    # Get the commit message
    with open(COMMIT_MSG_FILE, "r") as file:
        commit_message = file.read()

    # Check if the commit message follows the conventional commit format
    if not check_conventional_commit(commit_message):
        if DEBUG_PRINT:
            print(
                "Commit message does not follow the conventional commit format. Skipping..."
            )
        sys.exit(0)

    # Check if the commit message already contains package name
    # if check_package_name_existed(commit_message):
    #     print("Commit message already contains infomation. Skipping...")
    #     sys.exit(0)

    # Remove the existing package name from the commit message
    commit_message = remove_existing_package_name(commit_message)

    # Get the changed files
    result = subprocess.run(
        ["git", "diff", "--name-only", "--cached"], capture_output=True, text=True
    )

    changed_files = result.stdout.splitlines()
    package_names = set()
    for dir in PACKAGE_DIRS:
        package_names.update(get_pkg_names_from_dir(changed_files, dir))

    if DEBUG_PRINT:
        print("Dettected package names: ", package_names)

    # Add the package name to the commit message
    if len(package_names) != 0:
        git_pkg_name = map(
            lambda x: PACKAGE_NAME_SHORT[x] if x in PACKAGE_NAME_SHORT else x,
            package_names,
        )
        commit_message = add_package_name(commit_message, list(git_pkg_name))

    # Write the new commit message
    with open(COMMIT_MSG_FILE, "w") as file:
        file.write(commit_message)


if __name__ == "__main__":
    setup_global_vars()
    main()
