## Explain settings.json file

### Python overwrite PATH workaround

As of 21/6/2024, if 'python.terminal.activateEnvironment' is 'true', the Python
extension will overwrite the PATH set by the Dart extension, causing the
'flutter' commands to not be found in the terminal, breaking FVM in the process.

Therefore, the workaround for this issue is to set it to 'false' and manually configure the PATH for Python in the terminal settings.

```json
"python.terminal.activateEnvironment": false,
"python.defaultInterpreterPath": "${workspaceFolder}\\scripts\\.venv",
"terminal.integrated.env.windows": {
  "PATH": "${workspaceFolder}\\scripts\\.venv\\Scripts;${env:PATH}",
  "VIRTUAL_ENV": "${workspaceFolder}\\scripts\\.venv",
  "VIRTUAL_ENV_PROMPT": ".venv"
},
```

### FVM version

This is the version set by Flutter Version Management (FVM).

```json
"dart.flutterSdkPath": ".fvm/versions/3.19.6"
```
