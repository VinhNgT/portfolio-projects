import subprocess
import sys
import re


PACKAGE_NAME_SHORT = {
    "driving_license": "drv_lcn",
}


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


def main():
    print("Adding package name to commit message...")

    # Get the commit message
    with open(COMMIT_MSG_FILE, "r") as file:
        commit_message = file.read()

    # Check if the commit message follows the conventional commit format
    if not check_conventional_commit(commit_message):
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

    # Filter only get the one in apps/ and packages/
    changed_files = [
        file
        for file in changed_files
        if file.startswith("apps/") or file.startswith("packages/")
    ]

    # Extract the package name from each path and ensure uniqueness
    package_names = set()
    for file in changed_files:
        parts = file.split("/")
        if len(parts) > 1:
            if parts[1] in PACKAGE_NAME_SHORT:
                package_names.add(PACKAGE_NAME_SHORT[parts[1]])
            else:
                package_names.add(parts[1])

    # Add the package name to the commit message
    if len(package_names) != 0:
        commit_message = add_package_name(commit_message, list(package_names))

    # Write the new commit message
    with open(COMMIT_MSG_FILE, "w") as file:
        file.write(commit_message)


if __name__ == "__main__":
    setup_global_vars()
    main()
