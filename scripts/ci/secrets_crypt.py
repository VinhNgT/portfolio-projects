import argparse
from enum import Enum
from io import BytesIO
import os
from zipfile import ZipFile, ZIP_DEFLATED
from gnupg import GPG
import string
import secrets


def setup_global_var(package_name: str):
    global PROJECT_ROOT
    global CI_ROOT
    global SECRETS_GPG
    global TARGETS

    PROJECT_ROOT = os.path.join("apps", package_name)
    if not os.path.exists(PROJECT_ROOT):
        print(f"Project root not found: {PROJECT_ROOT}")
        exit(1)

    CI_ROOT = os.path.join(PROJECT_ROOT, "ci")
    SECRETS_GPG = os.path.join(CI_ROOT, "secrets.gpg")

    TARGETS = map(
        lambda x: os.path.join(PROJECT_ROOT, x),
        # Android secrets, specify folder by adding a trailing slash ('/')
        [
            "android/key.properties",
            "android/fastlane/Appfile",
            "keys/",
        ],
    )


class Mode(Enum):
    ENCRYPT = 1
    DECRYPT = 2


class StatusCode(Enum):
    SUCCESS = 0
    FAILURE = 1


def encrypt_file(file: BytesIO, password: str) -> StatusCode:
    gpg = GPG()
    encrypted_data = gpg.encrypt_file(
        file,
        recipients=None,
        symmetric="AES256",
        passphrase=password,
    )

    with open(SECRETS_GPG, "wb") as f:
        f.write(encrypted_data.data)


def decrypt_files(password: str, decrypt_to_zip: bool = False) -> StatusCode:
    gpg = GPG()
    with open(SECRETS_GPG, "rb") as f:
        decrypted_data = gpg.decrypt_file(f, passphrase=password)

    if not decrypted_data.ok:
        return StatusCode.FAILURE

    if decrypt_to_zip:
        with open(os.path.join(CI_ROOT, "secrets.zip"), "wb") as f:
            f.write(decrypted_data.data)
    else:
        unpack_targets(BytesIO(decrypted_data.data))

    return StatusCode.SUCCESS


def pack_targets() -> BytesIO:
    # A list of target files to be encrypted
    target_files = []

    for target in TARGETS:
        if not os.path.exists(target):
            print(f"Target not found: {target}")
            continue

        if os.path.isdir(target):
            for root, dirs, files in os.walk(target):
                for file in files:
                    target_files.append(os.path.join(root, file))

        else:
            target_files.append(target)

    if not target_files:
        print("No files to encrypt. Exiting...")
        exit(0)

    # Create an in memory zip file containing all of the targets
    in_memory_zip = BytesIO()

    with ZipFile(in_memory_zip, "w", ZIP_DEFLATED) as zipf:
        for file in target_files:
            zipf.write(file, os.path.relpath(file, PROJECT_ROOT))

    # Reset the file pointer to the beginning of the data
    in_memory_zip.seek(0)

    return in_memory_zip


def unpack_targets(file: BytesIO):
    with ZipFile(file, "r") as zipf:
        zipf.extractall(PROJECT_ROOT)


def main(mode: Mode, password: str):
    if mode == Mode.ENCRYPT:
        im_memory_zip = pack_targets()
        encrypt_file(im_memory_zip, password)
        print(f"Secrets encrypted successfully. Encrypted file in: {SECRETS_GPG}")

    elif mode == Mode.DECRYPT:
        statusCode = decrypt_files(password, decrypt_to_zip=False)
        if statusCode == StatusCode.FAILURE:
            print("Failed to decrypt secrets.gpg. Please check your password.")
            exit(1)

        print("Secrets decrypted successfully.")


def generate_password(length=64):
    characters = string.ascii_letters + string.digits
    password = "".join(secrets.choice(characters) for _ in range(length))
    return password


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Encrypt or decrypt secret files.")
    parser.add_argument(
        "-p", "--package", type=str, help="Package name of the app", required=True
    )
    group = parser.add_mutually_exclusive_group(required=True)
    group.add_argument(
        "-e", type=str, nargs="?", const=False, help="Encrypt mode, provide password"
    )
    group.add_argument("-d", type=str, help="Decrypt mode, provide password")

    args = parser.parse_args()
    setup_global_var(args.package)

    if args.e is not None:
        match args.e:
            case False:
                gen_password = generate_password()
                print(f"Encrypting with auto-generated password: {gen_password}")
                main(Mode.ENCRYPT, gen_password)

            case password:
                main(Mode.ENCRYPT, password)

    elif args.d:
        main(Mode.DECRYPT, args.d)
