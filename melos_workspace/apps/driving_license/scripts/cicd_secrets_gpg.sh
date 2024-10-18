#!/bin/bash

set -e

ACTION=""
PASSWORD=""

while getopts "edp:" opt; do
    case $opt in
    e)
        ACTION="encrypt"
        ;;
    d)
        ACTION="decrypt"
        ;;
    p)
        PASSWORD=$OPTARG
        ;;
    \?)
        exit 1
        ;;
    # :)
    #     echo "Option -$OPTARG requires an argument." 1>&2
    #     exit 1
    #     ;;
    esac
done

if [ -z "$ACTION" ]; then
    echo "You must specify an action: -e for encrypt or -d for decrypt."
    exit 1
fi

if [ -z "$PASSWORD" ]; then
    if [ "$ACTION" = "encrypt" ]; then
        read -sp "Enter password for encryption (leave empty for auto generation): " PASSWORD
        echo
    fi

    if [ "$ACTION" = "decrypt" ]; then
        read -sp "Enter password for decryption: " PASSWORD
        echo

        if [ -z "$PASSWORD" ]; then
            echo "You must specify a password."
            exit 1
        fi
    fi
fi

CICD_DIR='cicd'
SECRETS_ZIP_PATH="$CICD_DIR/secrets.zip"
SECRETS_ZIP_ASC_PATH="$CICD_DIR/secrets.zip.asc"
SECRETS_PASSWORD_PATH="$CICD_DIR/secrets_password.txt"

encrypt_secrets() {
    PASSWORD=$1
    TARGETS=(
        "keys"
    )

    # Zip the secrets
    echo "Zipping the secrets to $SECRETS_ZIP_PATH"
    zip -r $SECRETS_ZIP_PATH "${TARGETS[@]}"

    # Password handling
    if [ -z "$PASSWORD" ]; then
        PASSWORD=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32)
        echo "Using random generated password"
    else
        echo "Using provided password"
    fi

    # Save the password to a file
    echo "Do not check this file into version control!" >"$SECRETS_PASSWORD_PATH"
    echo "GPG decryption password: $PASSWORD" >>"$SECRETS_PASSWORD_PATH"
    echo "View password in $SECRETS_PASSWORD_PATH"

    # Encrypt the secrets
    echo "Encrypting $SECRETS_ZIP_PATH to $SECRETS_ZIP_ASC_PATH"
    rm -f $SECRETS_ZIP_ASC_PATH
    gpg --symmetric --cipher-algo AES256 --passphrase "$PASSWORD" \
        --armor --batch -o $SECRETS_ZIP_ASC_PATH $SECRETS_ZIP_PATH

    # Cleanup
    echo "Remove $SECRETS_ZIP_PATH"
    rm -f $SECRETS_ZIP_PATH
}

decrypt_secrets() {
    PASSWORD=$1

    # Decrypt the secrets
    echo "Decrypting $SECRETS_ZIP_ASC_PATH to $SECRETS_ZIP_PATH"
    rm -f $SECRETS_ZIP_PATH
    gpg --decrypt --batch --passphrase "$PASSWORD" \
        -o $SECRETS_ZIP_PATH $SECRETS_ZIP_ASC_PATH

    # Unzip the secrets
    echo "Unzipping the secrets"
    unzip -o $SECRETS_ZIP_PATH

    # Cleanup
    echo "Remove $SECRETS_ZIP_PATH"
    rm -f $SECRETS_ZIP_PATH
}

if [ "$ACTION" = "encrypt" ]; then
    encrypt_secrets $PASSWORD
elif [ "$ACTION" = "decrypt" ]; then
    decrypt_secrets $PASSWORD
fi
