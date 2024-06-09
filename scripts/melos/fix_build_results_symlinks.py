import argparse
import os

SYMLINKS = {
    "apk_release": "build/app/outputs/flutter-apk/",
    "bundle_release": "build/app/outputs/bundle/",
    "debug_symbols": "build/app/intermediates/merged_native_libs/prodRelease/out/lib/",
    "mapping.txt": "build/app/outputs/mapping/prodRelease/mapping.txt",
}


def setup_global_var(package_name: str):
    global PROJECT_ROOT
    PROJECT_ROOT = os.path.join("apps", package_name)
    if not os.path.exists(PROJECT_ROOT):
        print(f"Project root not found: {PROJECT_ROOT}")
        exit(1)


def create_symlinks(name: str, target: str):
    if os.path.lexists(name):
        os.remove(name)

    if not os.path.exists(target):
        print(f"Target not found: {target}")
        return

    print(f"Creating symlink: {name} -> {target}")
    os.symlink(
        os.path.relpath(target, os.path.dirname(name)),
        name,
        target_is_directory=os.path.isdir(target),
    )


def main():
    os.chdir(os.path.join(PROJECT_ROOT))
    print("Current working directory: ", os.getcwd())

    if not os.path.exists("build_result"):
        print("Creating build_result directory")
        os.makedirs("build_result")

    for name, target in SYMLINKS.items():
        create_symlinks(f"build_result/{name}", target)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Create symlinks for build results of Android app"
    )
    parser.add_argument(
        "-p", "--package", type=str, help="Package name of the app", required=True
    )
    args = parser.parse_args()
    setup_global_var(args.package)
    # setup_global_var("driving_license")
    main()
