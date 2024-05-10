import subprocess


def set_git_hooks_path():
    try:
        # Set the Git hooks directory
        subprocess.check_call(["git", "config", "core.hooksPath", ".githooks"])
        print("Git hooks path has been set to .githooks")

    except subprocess.CalledProcessError as e:
        print("Failed to set Git hooks path:", e)


if __name__ == "__main__":
    set_git_hooks_path()
