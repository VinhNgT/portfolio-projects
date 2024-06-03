import sys
from ruamel.yaml.comments import CommentedMap
import os
from git import Repo

sys.path.append(os.getcwd())
from scripts.common import build_yaml


# When melos gives packages a new version, the pubspec.yaml files of them will be updated.
# We can use this to determine which apps have a new version and increase their build number.
def flutter_project_dir_with_new_version() -> list[str]:
    changed_files = Repo().index.diff(None)

    # Get all the pubspec.yaml files in the apps directory (which means it is a flutter project)
    pubspec_files = [
        file.a_path
        for file in changed_files
        if file.a_path.startswith("apps/") and file.a_path.endswith("pubspec.yaml")
    ]

    # Get the parent directory of the pubspec.yaml files
    project_dir_with_new_version = [os.path.dirname(file) for file in pubspec_files]

    return project_dir_with_new_version


def increase_build_number(flutter_dir: str) -> int:
    build_info_path = os.path.join(flutter_dir, "build_info.yaml")
    yaml = build_yaml()

    if os.path.exists(build_info_path):
        with open(build_info_path, "r") as file:
            # Load the yaml data
            data = yaml.load(file)

        # Increase the 'build_number' by 1
        data["build_number"] += 1
    else:
        # If the file does not exist, create it with 'build_number' set to 1
        data = CommentedMap({"build_number": 1})
        data.yaml_set_comment_before_after_key(
            "build_number",
            before="This value will/should be increased by 1 for each new version of the app.",
        )

    # Write the updated data back to the yaml file
    with open(build_info_path, "w") as file:
        yaml.dump(data, file)

    return data["build_number"]


def main():
    flutter_dir_list = flutter_project_dir_with_new_version()

    new_build_numbers = []
    for flutter_dir in flutter_dir_list:
        new_build_numbers.append(increase_build_number(flutter_dir))

    if len(flutter_dir_list) > 0:
        print("Increased the build number of the following apps:")
        for flutter_dir in flutter_dir_list:
            print(f"  - {flutter_dir} ({new_build_numbers.pop(0)})")

    else:
        print("No apps have a new version.")


if __name__ == "__main__":
    main()
