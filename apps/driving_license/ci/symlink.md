## How to create symlink for this folder in Windows

- Open CMD with administrator
- Change dir with

  ```cmd
  f:
  ```

- Navigate to this folder:

  ```cmd
  cd F:\projects\Flutter\portfolio_projects\apps\driving_license\ci
  ```

- Create link:

  ```cmd
  mklink /d bundle_release ..\build\app\outputs\bundle\release
  mklink /d debug_symbols ..\build\app\intermediates\merged_native_libs\release\out\lib

  ...
  ```
