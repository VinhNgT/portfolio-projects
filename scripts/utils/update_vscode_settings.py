import os
import sys
import json

sys.path.append(os.getcwd())
from scripts.common import get_packages_list

TARGETS = [
    "apps",
    "packages",
]


def active_python_manually(package_path: str):
    """
    Update the settings.json file to manually activate the virtual environment.

    For more information, refer to `settings_explain.md` in the root `.vscode`
    folder.
    """

    venv_rel_path = os.path.relpath("scripts/.venv", package_path).replace("\\", "/")

    new_settings = {
        "python.terminal.activateEnvironment": False,
        "python.defaultInterpreterPath": "${workspaceFolder}/" f"{venv_rel_path}",
        "terminal.integrated.env.windows": {
            "PATH": "${workspaceFolder}/" f"{venv_rel_path}" "/Scripts;${env:PATH}",
            "VIRTUAL_ENV": "${workspaceFolder}/" f"{venv_rel_path}",
            "VIRTUAL_ENV_PROMPT": ".venv",
        },
    }

    update_setting(package_path, new_settings)


def update_setting(package_path: str, new_settings: dict):
    vscode_settings = os.path.join(package_path, ".vscode", "settings.json")

    # Create the json file if it doesn't exist or is empty
    if not os.path.exists(vscode_settings) or os.path.getsize(vscode_settings) == 0:
        with open(vscode_settings, "w") as file:
            json.dump({}, file, indent=2)

    with open(vscode_settings, "r") as f:
        settings = json.load(f)

    settings.update(new_settings)
    with open(vscode_settings, "w") as file:
        json.dump(settings, file, indent=2)


def main():
    # For the root monorepo
    active_python_manually(".")

    # For each packages
    for target in TARGETS:
        for package in get_packages_list(target):
            package_path = os.path.join(target, package)
            active_python_manually(package_path)


if __name__ == "__main__":
    main()
