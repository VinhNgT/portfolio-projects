import subprocess
import os
import sys
from zipfile import ZipFile, ZIP_DEFLATED
import hashlib


DEBUG_SYMBOLS_DIR = "../../build/app/intermediates/merged_native_libs/release/out/lib/"
DEBUG_SYMBOLS_ZIP_NAME = "native-debug-symbols.zip"
DEBUG_SYMBOLS_ZIP_PATH = os.path.join(DEBUG_SYMBOLS_DIR, DEBUG_SYMBOLS_ZIP_NAME)

BUILD_COMMAND = (
    "flutter build appbundle --obfuscate "
    "--split-debug-info=ci/build_obfuscation "
    "--extra-gen-snapshot-options=--save-obfuscation-map=ci/build_obfuscation/app.obfuscation.map.json"
)


def run_flutter_build() -> int:
    print(f"Running command: {BUILD_COMMAND} \n")

    # Flush the buffer to make sure all of the pending messages is printed.
    sys.stdout.flush()

    # Start the command
    process = subprocess.Popen(
        BUILD_COMMAND,
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


def is_zip_up_to_date() -> bool:
    if not os.path.exists(DEBUG_SYMBOLS_ZIP_PATH):
        return False

    # Calculate hashes of files already in the zip file
    zip_hashes = {}
    with ZipFile(DEBUG_SYMBOLS_ZIP_PATH, "r") as zipf:
        for file in zipf.namelist():
            file_hash = hashlib.md5(zipf.read(file)).hexdigest()
            zip_hashes[file] = file_hash

    # Calculate hashes of all folders in DEBUG_SYMBOLS_DIR
    folders = get_debug_symbols_folders()
    folders_hashes = {}
    for folder in folders:
        for root, _, files in os.walk(os.path.join(DEBUG_SYMBOLS_DIR, folder)):
            for file in files:
                file_path = os.path.join(root, file)
                rel_path = os.path.relpath(file_path, DEBUG_SYMBOLS_DIR).replace(
                    "\\", "/"
                )
                with open(file_path, "rb") as f:
                    file_hash = hashlib.md5(f.read()).hexdigest()
                    folders_hashes[rel_path] = file_hash

    # Check if the hashes are the same
    return zip_hashes == folders_hashes


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


def main():
    print("Building app bundle...")
    build_result = run_flutter_build()

    if build_result == 0:
        print()
        if is_zip_up_to_date():
            print("The debug symbols zip is already up-to-date. Zip creation skipped.")
        else:
            print("Zipping the debug symbols...")
            zip_debug_symbols()

    sys.exit(build_result)


if __name__ == "__main__":
    main()
