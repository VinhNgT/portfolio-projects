# Steps to create a new app

## Install dependencies

```powershell
dart pub global activate melos
dart pub global activate rename
```

## Create and config app

- Run `flutter create` in `apps` folder.
- Run `melos bootstrap`
- Navigate (`cd`) to that app.
- Create symlink of files in `common/.vscode_flutter` to `.vscode`.
- Update analysis_options.yaml and build.yaml
