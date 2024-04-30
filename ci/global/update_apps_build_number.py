from ruamel.yaml import YAML
from ruamel.yaml.comments import CommentedMap
import os
from git import Repo


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


def append_pubspec_build_number(flutter_dir: str, build_number: int):
    pubspec_path = os.path.join(flutter_dir, "pubspec.yaml")
    yaml = build_yaml()

    with open(pubspec_path, "r") as file:
        data = yaml.load(file)

    # Assuming the version is in the format 'x.y.z+build' or 'x.y.z'
    if "+" in data["version"]:
        version_data, _ = data["version"].split("+")
    else:
        version_data = data["version"]

    data["version"] = f"{version_data}+{build_number}"

    with open(pubspec_path, "w") as file:
        yaml.dump(data, file)


def build_yaml() -> YAML:
    yaml = YAML()
    yaml.preserve_quotes = True
    yaml.indent(mapping=2, sequence=4, offset=2)
    return yaml


def main():
    flutter_dir_list = flutter_project_dir_with_new_version()
    for flutter_dir in flutter_dir_list:
        new_build_number = increase_build_number(flutter_dir)
        append_pubspec_build_number(flutter_dir, new_build_number)

    if len(flutter_dir_list) > 0:
        print("Increased the build number of the following apps:")
        for flutter_dir in flutter_dir_list:
            print(f"  - {flutter_dir}")

    else:
        print("No apps have a new version.")


if __name__ == "__main__":
    main()
