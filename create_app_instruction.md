# Steps to create a new app

## Install dependencies

### FVM

```powershell
choco install fvm
fvm install 3.19.6
fvm global 3.19.6
```

### Dart tools

```powershell
dart pub global activate melos
dart pub global activate rename
```

## Create and config app

_We plan to have a script that automate all of this._

- Run `flutter create` in `apps` folder.
- Set the Flutter SDK version for this app:
  ```powershell
  fvm use 3.19.6
  ```
- Run `melos bootstrap`.
- Navigate (`cd`) to the new app's folder.
- Create `.vscode` folder and symlink files in `common/.vscode_flutter` to this `.vscode`.
- Add this to settings.json, create this file if missing, without this some
  melos scripts will not run:
  ```json
  "python.defaultInterpreterPath": "${workspaceFolder}/../../scripts/.venv"
  ```
- Update `analysis_options.yaml` and `build.yaml`, you can copy them from other stable projects.
- In the `.githooks/add_package_name.py` file, assign a short name of this app to the `PACKAGE_NAME_SHORT` variable.
- Setup `pubspec.yaml`.
- Run rename to set app name and bundle id (remember to use `_` for android and `-` for ios):

  ```powershell
  rename setAppName --value "YourAppName"
  rename setBundleId --targets android --value "com.example.bundle_Id"
  rename setBundleId --targets ios --value "com.example.bundle-Id"
  ```

## Make app compatible with CI/CD

_To be added_
