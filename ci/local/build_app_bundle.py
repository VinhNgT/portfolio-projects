import subprocess
import os
import sys
from zipfile import ZipFile, ZIP_DEFLATED
import argparse


def setup_global_var(package_name: str):
    global PROJECT_ROOT
    global BUILD_COMMAND

    global DEBUG_SYMBOLS_DIR
    global BUILD_OBFUSCATION_DIR

    global DEBUG_SYMBOLS_ZIP_NAME
    global BUILD_OBFUSCATION_ZIP_NAME

    global DEBUG_SYMBOLS_ZIP_PATH
    global BUILD_OBFUSCATION_ZIP_PATH

    PROJECT_ROOT = os.path.join("apps", package_name)
    if not os.path.exists(PROJECT_ROOT):
        print(f"Project root not found: {PROJECT_ROOT}")
        exit(1)

    BUILD_COMMAND = (
        "flutter build appbundle --obfuscate "
        "--split-debug-info=ci/build_obfuscation "
        "--extra-gen-snapshot-options=--save-obfuscation-map=ci/build_obfuscation/app.obfuscation.map.json"
    )

    DEBUG_SYMBOLS_DIR = os.path.join(
        PROJECT_ROOT,
        "build",
        "app",
        "intermediates",
        "merged_native_libs",
        "release",
        "out",
        "lib",
    )
    BUILD_OBFUSCATION_DIR = os.path.join(PROJECT_ROOT, "ci", "build_obfuscation")

    DEBUG_SYMBOLS_ZIP_NAME = "native-debug-symbols.zip"
    BUILD_OBFUSCATION_ZIP_NAME = "obfuscation.zip"

    DEBUG_SYMBOLS_ZIP_PATH = os.path.join(DEBUG_SYMBOLS_DIR, DEBUG_SYMBOLS_ZIP_NAME)
    BUILD_OBFUSCATION_ZIP_PATH = os.path.join(
        BUILD_OBFUSCATION_DIR, BUILD_OBFUSCATION_ZIP_NAME
    )


def run_flutter_build() -> int:
    print(f"Running command: {BUILD_COMMAND} \n")

    # Flush the buffer to make sure all of the pending messages is printed.
    sys.stdout.flush()

    # Start the command
    process = subprocess.Popen(
        BUILD_COMMAND,
        cwd=PROJECT_ROOT,
        shell=True,
        # stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )

    for line in iter(process.stderr.readline, b""):
        sys.stdout.write(line.decode())

    # Wait for the command to complete
    process.wait()

    if process.returncode != 0:
        print(f"Flutter build failed with return code: {process.returncode}")

    return process.returncode


def get_debug_symbols_folders():
    return [
        f
        for f in os.listdir(DEBUG_SYMBOLS_DIR)
        if os.path.isdir(os.path.join(DEBUG_SYMBOLS_DIR, f))
    ]


def get_build_obfuscation_files():
    return [
        f
        for f in os.listdir(BUILD_OBFUSCATION_DIR)
        if os.path.isfile(os.path.join(BUILD_OBFUSCATION_DIR, f))
        and f != BUILD_OBFUSCATION_ZIP_NAME
    ]


def zip_debug_symbols():
    # Get all folders in the directory
    folders = get_debug_symbols_folders()

    # Recursively zip all folders
    with ZipFile(
        os.path.join(DEBUG_SYMBOLS_DIR, DEBUG_SYMBOLS_ZIP_NAME), "w", ZIP_DEFLATED
    ) as zipf:
        for folder in folders:
            for root, _, files in os.walk(os.path.join(DEBUG_SYMBOLS_DIR, folder)):
                for file in files:
                    zipf.write(
                        os.path.join(root, file),
                        os.path.relpath(os.path.join(root, file), DEBUG_SYMBOLS_DIR),
                    )


def zip_obfuscation_files():
    files = get_build_obfuscation_files()

    with ZipFile(
        os.path.join(BUILD_OBFUSCATION_DIR, BUILD_OBFUSCATION_ZIP_NAME),
        "w",
        ZIP_DEFLATED,
    ) as zipf:
        for file in files:
            zipf.write(
                os.path.join(BUILD_OBFUSCATION_DIR, file),
                os.path.relpath(
                    os.path.join(BUILD_OBFUSCATION_DIR, file), BUILD_OBFUSCATION_DIR
                ),
            )


def main():
    print("Building app bundle...")
    build_result = run_flutter_build()

    if build_result == 0:
        print("\nZipping symbols...")
        zip_debug_symbols()
        zip_obfuscation_files()

        print("Debug symbols location:", DEBUG_SYMBOLS_ZIP_PATH)
        print("Obfuscation files location:", BUILD_OBFUSCATION_ZIP_PATH)

    sys.exit(build_result)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Build app bundle and zip debug symbols."
    )
    parser.add_argument(
        "-p", "--package", type=str, help="Package name of the app", required=True
    )

    args = parser.parse_args()
    setup_global_var(args.package)

    main()
