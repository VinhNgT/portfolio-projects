import subprocess
import os
import sys
import argparse


def setup_global_var(package_name: str, dry_run: bool):
    global PROJECT_ROOT
    global BUILD_COMMAND

    PROJECT_ROOT = os.path.join("apps", package_name)
    if not os.path.exists(PROJECT_ROOT):
        print(f"Project root not found: {PROJECT_ROOT}")
        exit(1)
    BUILD_COMMAND = (
        f"bundle exec fastlane deploy_internal publish:{'false' if dry_run else 'true'}"
    )


def deploy_playstore() -> int:
    print(f"Running command: {BUILD_COMMAND} \n")

    # Flush the buffer to make sure all of the pending messages is printed.
    sys.stdout.flush()

    # Start the command
    process = subprocess.Popen(
        BUILD_COMMAND,
        cwd=os.path.join(PROJECT_ROOT, "android"),
        shell=True,
        # stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
    )

    for line in iter(process.stderr.readline, b""):
        sys.stdout.write(line.decode())

    # Wait for the command to complete
    process.wait()

    if process.returncode != 0:
        print(f"Play Store deployment failed with return code: {process.returncode}")

    return process.returncode


def main():
    print("Deploying to Play Store...")
    deployment_result = deploy_playstore()
    sys.exit(deployment_result)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Deploy app to Play Store.")
    parser.add_argument(
        "-p", "--package", type=str, help="Package name of the app", required=True
    )
    parser.add_argument(
        "--dryrun", action="store_true", help="Do a dry run (not actually deploy)"
    )

    args = parser.parse_args()
    setup_global_var(args.package, args.dryrun)

    main()
