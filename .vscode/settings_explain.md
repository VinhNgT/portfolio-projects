## Explain settings.json file

### Python overwrite PATH workaround

As of 21/6/2024, if 'python.terminal.activateEnvironment' is 'true', the Python extension will overwrite the PATH set by the Dart extension, causing the 'flutter' commands to be missing from PATH.

The workaround for this issue is to set it to 'false' and manually configure PATH for Python in the terminal settings.

```json
"python.terminal.activateEnvironment": false,
"python.defaultInterpreterPath": "${workspaceFolder}\\scripts\\.venv",
"terminal.integrated.env.windows": {
  "PATH": "${workspaceFolder}\\scripts\\.venv\\Scripts;${env:PATH}",
  "VIRTUAL_ENV": "${workspaceFolder}\\scripts\\.venv",
},
```

### Disable get/upgrade packages notification

If `pub get` or `pub upgrade` is run from this notification, it's going to use the Flutter SDK of the root workspace for all of the child packages, breaking all of them if they are configured to use a different SDK version.

You should use good ol' `flutter pub get` instead, or `melos run fvm-get` if you want to `pub get` all of the child packages using their correct Flutter SDK version.

```json
"dart.promptToGetPackages": false
```

### FVM version

This is the Flutter SDK version set by Flutter Version Management (FVM). Do not edit this manually.

```json
"dart.flutterSdkPath": ".fvm/versions/3.19.6"
```
