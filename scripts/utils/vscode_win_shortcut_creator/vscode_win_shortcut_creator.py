import os
from win32com.client import Dispatch

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
CODE_DIR = "C:\\Users\\victo\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe"


class TargetEntry:
    def __init__(self, path: str, icon: str):
        self.path = path
        self.icon = icon

    def __str__(self):
        return f"{self.path} - {self.icon}"


TARGETS = [
    TargetEntry("apps", "application.ico"),
    TargetEntry("packages", "box.ico"),
    TargetEntry("submodules", "cubes.ico"),
]


def get_packages_list(path: str) -> list[str]:
    if not os.path.exists(path):
        return []

    packages = []
    for package in os.listdir(path):
        if os.path.isdir(os.path.join(path, package)):
            packages.append(package)

    return packages


def create_shortcut(path: str, destination_path: str, icon: str):
    icon_path = os.path.join(
        SCRIPT_DIR,
        "icons",
        icon,
    )

    shell = Dispatch("WScript.Shell")
    shortcut = shell.CreateShortCut(os.path.abspath(path))
    shortcut.Targetpath = CODE_DIR
    shortcut.Arguments = os.path.abspath(destination_path)
    shortcut.IconLocation = f"{icon_path}, 0"
    shortcut.save()


def create_shortcut_repo():
    os.makedirs(os.path.join(SCRIPT_DIR, "results"), exist_ok=True)
    current_dir = os.path.basename(os.getcwd())

    create_shortcut(
        os.path.join(SCRIPT_DIR, "results", f"{current_dir}.lnk"),
        ".",
        "folder.ico",
    )


def main():
    create_shortcut_repo()

    for target in TARGETS:
        packages = get_packages_list(target.path)

        if not packages:
            print(f"Target '{target.path}' is empty, skipping...")
            continue

        for package in packages:
            os.makedirs(os.path.join(SCRIPT_DIR, "results", target.path), exist_ok=True)

            create_shortcut(
                os.path.join(
                    SCRIPT_DIR,
                    "results",
                    target.path,
                    f"{package}.lnk",
                ),
                os.path.join(target.path, package),
                target.icon,
            )


if __name__ == "__main__":
    main()
