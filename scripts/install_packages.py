import argparse
import os
import json
import subprocess


def is_package_installed(package):
    try:
        subprocess.run(
            ["pacman", "-Qi", package],
            check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )
        return True
    except subprocess.CalledProcessError:
        return False


def is_group_installed(group):
    try:
        result = subprocess.run(
            ["pacman", "-Qg", group],
            check=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            text=True,
        )
        return bool(result.stdout.strip())
    except subprocess.CalledProcessError:
        return False


def check_and_install(packages):
    for package in packages:
        if is_package_installed(package) or is_group_installed(package):
            print(f"'{package}' is already installed.")
        else:
            subprocess.run(["sudo", "pacman", "-S", "--noconfirm", package], check=True)


def main():
    packages = {}
    with open("packages.json", "r") as f:
        packages = json.load(f)

    parser = argparse.ArgumentParser(description="Install packages based on category.")
    parser.add_argument(
        "-c",
        "--category",
        action="append",
        choices=packages.keys(),
        help="Category of packages to install (system, fonts, gui)",
    )
    args = parser.parse_args()

    if args.category:
        for category in args.category:
            print(f"\nChecking '{category}' packages:")
            check_and_install(packages[category])
    else:
        for category, pkgs in packages.items():
            print(f"\nChecking {category} packages:")
            check_and_install(pkgs)

    print("\nDone")


if __name__ == "__main__":
    main()
