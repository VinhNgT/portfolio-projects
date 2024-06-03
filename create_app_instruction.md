# Steps to create a new app

## Install dependencies

```powershell
dart pub global activate melos
dart pub global activate rename
```

## Create and config app

- Run `flutter create` in `apps` folder.
- Run `melos bootstrap`.
- Navigate (`cd`) to the new app's folder.
- Create `.vscode` folder and symlink files in `common/.vscode_flutter` to this `.vscode`.
- Update `analysis_options.yaml` and `build.yaml`, you can copy them from other stable projects.
- In the `.githooks/add_package_name.py` file, assign a short name of this app to the `PACKAGE_NAME_SHORT` variable.

## Make app compatible with CI/CD

_To be added_
