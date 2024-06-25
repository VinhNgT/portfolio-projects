import os
from ruamel.yaml import YAML


def build_yaml() -> YAML:
    yaml = YAML()
    yaml.preserve_quotes = True
    yaml.indent(mapping=2, sequence=4, offset=2)
    return yaml


def get_packages_list(rel_path: str) -> list[str]:
    if not os.path.exists(rel_path):
        return []

    packages = []
    for package in os.listdir(rel_path):
        if os.path.isdir(os.path.join(rel_path, package)):
            packages.append(package)

    return packages
