![Feature Graphic](android/fastlane/metadata/android/vi/images/featureGraphic.png)

# Drive Ready

Ứng dụng di động giúp người dùng ôn tập kiến thức lý thuyết để chuẩn bị cho kỳ thi giấy phép lái xe hạng A và B. Cung cấp các câu hỏi trắc nghiệm và tài liệu học để người dùng có thể nắm vững kiến thức cần thiết.

![GitHub stable release](https://img.shields.io/github/v/release/VinhNgT/portfolio_projects?filter=driving_license*&style=flat-square&label=stable%20release&logo=googleplay)
![GitHub latest release](https://img.shields.io/github/v/release/VinhNgT/portfolio_projects?include_prereleases&filter=driving_license*&style=flat-square&label=latest%20release&logo=github)

## Yêu cầu hệ thống

Để chạy và phát triển ứng dụng, bạn cần đáp ứng các yêu cầu hệ thống sau:

- [Flutter SDK 3.2.6](https://docs.flutter.dev/release/archive) trở lên.
- Đã cài đặt [Python 3.12.3](https://www.python.org/downloads/) trở lên.
- (Windows) Sử dụng [PowerShell 7.0](https://learn.microsoft.com/en-us/powershell/scripting/whats-new/) trở lên.
- (Windows) Đã cài đặt [Ruby+Devkit 3.2.4-1](https://rubyinstaller.org/downloads/) trở lên.
- ~~(Windows) Đã cài đặt [Gpg4win 4.3.1](https://www.gpg4win.org/get-gpg4win.html) trở lên.~~
- Android Studio hoặc IntelliJ IDEA / VS Code với plugin Flutter.
- Thiết bị Android hoặc máy ảo Android để chạy ứng dụng.

## Cài đặt

Để chạy ứng dụng, làm theo các bước sau:

1. Clone repository này về máy của bạn.
2. Mở terminal và di chuyển đến thư mục chứa mã nguồn của ứng dụng.
3. Chạy lệnh `flutter pub get` để cài đặt các phụ thuộc cần thiết.
4. Chạy lệnh `flutter run` để khởi chạy ứng dụng trên thiết bị hoặc máy ảo.

## Xây dựng từ mã nguồn thành APK

Nếu bạn muốn xây dựng ứng dụng từ mã nguồn, làm theo các bước sau:

1. Mở terminal và di chuyển đến thư mục chứa mã nguồn của ứng dụng.
2. Chạy lệnh `flutter build apk` để xây dựng ứng dụng thành file app APK.

## Xây dựng từ mã nguồn để phát hành trên Play Store

> [!WARNING]
> Phần build app và phát hành lên Play Store được hoàn toàn tự động hoá bằng CI/CD. Do khả năng human error cao, chỉ thực hiện build app thủ công theo hướng dẫn này nếu như hệ thống CI/CD không hoạt động.

> Khuyến khích sử dụng Melos và fastlane để build và phát hành app, xem mục [Tự động hoá quá trình phát hành trên Play Store](#Tự-động-hoá-quá-trình-phát-hành-trên-Play-Store)

- Tạo `upload-keystore.jks` theo hướng dẫn tại:

  https://docs.flutter.dev/deployment/android#create-an-upload-keystore

- Tạo thư mục mới `/keys` tại thư mục gốc.
- Đưa `upload-keystore.jks` cho vào thư mục `/keys`.
- Tạo file `key.properties` tại thư mục `/android` theo mẫu:

  ```properties
  storePassword=password0
  keyPassword=password0
  keyAlias=upload
  storeFile=keys/upload-keystore.jks
  ```

- Cập nhật trường `version` trong `pubspec.yaml` theo nếu cần thiết:

  ```yaml
  version: 1.2.3
  ```

- Xây dựng ứng dụng thành file app bundle:

  ```powershell
  flutter build appbundle --obfuscate --split-debug-info=build_obfuscation --extra-gen-snapshot-options=--save-obfuscation-map=build_obfuscation/app.obfuscation.map.json --build-number=1
  ```

  Giá trị `--build-number` phải lớn hơn tất cả các `versionCode` đang có sẵn trên Play Store, nếu không lúc upload sẽ bị reject. Ở ví dụ này Play Store chưa có upload nào cả (đây là lần upload đầu tiên), nên đặt giá trị là `1`.

  > Để xem các upload hiện đang có trên Play Store, xem mục App bundle explorer trên trang web [Google Play Console](https://play.google.com/console/).

  - Kết quả app bundle tại đường dẫn:

    `apps/driving_license/build/app/outputs/bundle/release/app-release.aab`

  - File mapping.txt, upload file này kèm app bundle lên Play Store:

    `apps/driving_license/build/app/outputs/mapping/release/mapping.txt`

  - Các debug symbol, tạo file zip `native-debug-symbols.zip` chứa các folder trong này để upload kèm app bundle lên Play Store:

    `apps/driving_license/build/app/intermediates/merged_native_libs/release/out/lib`

  - Các file để de-obfuscation nằm trong folder `build_obfuscation`.

- Cuối cùng thao tác trên Google Play Console để upload kết quả build.

## Tự động hoá quá trình phát hành trên Play Store

<details>
  <summary>Vì sao phải tự động hoá ?</summary>

#### Quá trình publish, cập nhật ứng dụng lên Play Store có rất nhiều bước:

1. Cập nhật `version` trong `pubspec.yaml`.

2. Build ứng dụng, kiểm tra thủ công giá trị `versionCode` mới nhất để chọn `--build-number` lớn hơn. Nếu chọn sai sẽ không thể upload được và phải build lại.

3. Tạo `native-debug-symbols.zip`.

4. Truy cập Google Play Console để upload kết quả build (3 file) lên các track test (Internal tesing, Closed testing,...)

   - app-release.aab
   - mapping.txt
   - native-debug-symbols.zip

5. Sau khi test xong sẽ lại phải dùng Google Play Console để chuyển từ track test sang track production.

#### Quá trình trên có quá nhiều chỗ mà người thực hiện có thể mắc sai lầm, ví dụ như:

- Quên chưa cập nhật `version` trong `pubspec.yaml` .

  => Phải sửa xong build lại.

- Không nắm bắt được `version` của ứng dụng phải là giá trị gì.

  => Dẫn đến conflict version với các package, ứng dụng khác trong monorepo, hoặc mặc dù source code ứng dụng không thay đổi nhưng người thực hiện có thể không biết và tiếp tục tiến hành build version mới.

- Chọn sai `--build-number`.

  => Phải sửa xong build lại.

- Quên chưa tạo `native-debug-symbols.zip`.

  => Phải di chuyển đến folder chứa các debug symbol và dùng WinRAR để tạo.

- Upload nhầm file ABB, mapping hoặc native-debug-symbols.zip.

  => Gây lỗi ứng dụng hoặc mất khả năng debug, phải upload lại đúng file.

- ...

Các pain point trên có thể gây lãng phí rất nhiều thời gian, đặc biệt nếu người thực hiện chỉ là dev thuần không có kinh nghiệm publish app, bởi vậy dự án đã cấu hình 2 công cụ Melos và fastlane, cùng với các script Python hỗ trợ để tự động hoá toàn bộ quá trình này.

</details>

### Kích hoạt Melos

Chạy lệnh sau để cài đặt Melos vào hệ thống:

```powershell
dart pub global activate melos
```

Lưu ý folder sau phải nằm trong danh sách enviroment path:

```
Linux: $HOME/.pub-cache/bin
Windows: %LOCALAPPDATA%\Pub\Cache\bin
```

### Tự động quá trình chuẩn bị phiên bản mới của app

#### Tạo version mới bằng Melos

Sử dụng Melos để tự động update trường `version` tron `pubspec.yaml` của ứng dụng này và tất cả các package khác trong monorepo theo tiêu chuẩn [Semantic Versioning](https://semver.org/).

Sau mỗi lần sprint, chạy lệnh sau để Melos rà soát tất cả các commit trên monorepo:

```powershell
melos version -a -p

# Result: `4.0.0-dev.0`, `4.0.0-dev.1`, `4.0.0-dev.2`, ...
```

Melos sẽ tự động tạo commit và tag version mới của tất cả app và package có source code bị thay đổi trong monorepo, tức là package nào không thay đổi thì sẽ không có version mới.

Sau khi ứng dụng đạt đến trạng thái ổn định nào đó, chạy lệnh sau để gán mã version ổn định:

```powershell
melos version -a -g

# Result: `4.0.0`, `4.0.1`, `4.2.1`, ...
```

#### Chuẩn bị upload key

- Tạo `upload-keystore.jks` theo hướng dẫn tại:

  https://docs.flutter.dev/deployment/android#create-an-upload-keystore

- Tạo thư mục mới `/keys` tại thư mục gốc của app.
- Đưa `upload-keystore.jks` cho vào thư mục `/keys`.
- Tạo file `key.properties` tại thư mục `/android` theo mẫu:

  ```properties
  storePassword=password0
  keyPassword=password0
  keyAlias=upload
  storeFile=keys/upload-keystore.jks
  ```

#### Cài đặt các Python dependency

Tại thư mục root của monorepo, chạy các lệnh sau để thiết lập môi trường Python:

```powershell
python -m venv .venv

# (Windows - Powershell)
.venv/Scripts/Activate.ps1

# (Linux - bash)
# source .venv/bin/activate

python -m pip install -r ci/requirements.txt
```

#### Xây dựng và sign app

Sau khi chuẩn bị key upload xong, xây dựng app bằng lệnh:

```powershell
melos run build-android-release -- -p <package_name> --appbundle
```

Với `<package_name>` là app mình muốn build. File AAB sẽ được build và sign bằng key mình vừa cung cấp.

> [!NOTE]
> Kết quả build nằm trong folder `ci` tại mỗi thư mục app để bạn dễ dàng truy cập, không được xoá bất cứ thứ gì trong này do có chứa các symbolic link.

Ví dụ bạn muốn build app `driving_license`, chạy lệnh:

```powershell
melos run build-android-release -- -p driving_license --appbundle
```

### Tự động phát hành lên Google Play Store bằng fastlane

#### Cài đặt môi trường

Vào thư mục project của app, chạy:

```powershell
cd android
gem install bundler
bundle install
bundle update fastlane
```

#### Chuẩn bị tài khoản service

- Lấy file key json và cấu hình tài khoản service theo hướng dẫn tại:

  https://docs.fastlane.tools/getting-started/android/setup/#setting-up-supply

- File key json nhận được (ví dụ: `driving-license-123456-123321123321.json`) đặt vào folder `keys` chung với `upload-keystore.jks`.

- Tạo file `Appfile` trong folder `android/fastlane` theo mẫu:

  ```powershell
  json_key_file("../keys/driving-license-123456-123321123321.json")
  package_name("com.vikapps.driving_license")
  ```

- Tiến hành kết nối tới Play Store và tải về các metadata (tên app, mô tả, ...):

  ```powershell
  fastlane supply init
  ```

#### Upload app bundle lên Play Store

```powershell
melos run deploy-playstore -- -p driving_license
```

Hoặc bạn ko muốn upload lên Play Store thật mà chỉ muốn chạy test:

```powershell
melos run deploy-playstore -- -p driving_license --dryrun
```

#### Tổng kết:

Sau khi cấu hình xong, mỗi lần bạn cần upload một phiên bản mới lên Play Store, chỉ cần phải chạy 3 lệnh:

```powershell
# Generate version mới
melos version -a -p

# Build và sign app
melos run build-android-release -- -p driving_license --appbundle

# Upload kết quả
melos run deploy-playstore -- -p driving_license
```

## CI/CD với Github Actions

### Mã hoá các secret để hệ thống CI/CD sử dụng

Để đảm bảo an toàn bảo mật thông tin, KHÔNG ĐƯỢC thêm các file và folder nhạy cảm này trong thư mục project app vào git:

- `android/key.properties`
- `keys/`
- `secrets.zip` (nếu có)

Ta cần phải mã hoá chúng trước rồi mới được thêm vào, hệ thống CI/CD sẽ tự động giải mã mỗi lần sử dụng.

#### Mã hoá GPG

Chạy lệnh sau để mã hoá các secret của app:

```powershell
melos run secrets-crypt -- -p driving_license -e
```

Kết quả in ra trong console:

```
Encrypting with auto-generated password: <password>
Secrets encrypted successfully. Encrypted file in: ci/secrets.gpg
```

Lưu ý phần `<password>`, thêm nó vào danh sách các secret của repository của bạn với key `DRIVING_LICENSE_SECRETS_KEY`, xem [hướng dẫn](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions?tool=webui#creating-secrets-for-a-repository).

Bạn có thể an toàn commit file `secrets.gpg` vào git, vì nó đã được mã hoá bằng password 64 ký tự, [bruteforce đằng trời](https://github.com/VinhNgT/imagehost/blob/main/brute_pic.png?raw=true).

#### Kích hoạt workflow đẩy lên track internal của Google Play Console

Tạo version mới với lệnh sau:

```powershell
melos version -a -p
```

Sau đó commit và push với `git push --follow-tags`, hệ thống Github Actions sẽ phân tích các ứng dụng đã được cập nhật source code mới và tự động build, test và upload lên track internal của Google Play.

Cuối cùng vào trang web quản trị của ứng dụng trên Google Play Console, vào `Internal testing`, điền các thông tin cần thiết (Changelog) cho ứng dụng.

Sau khi publish xong có thể chuyển sang track production hoặc beta/rc tuỳ yêu cầu thực tế.

## Liên hệ

Nếu bạn có bất kỳ câu hỏi hay góp ý nào, hãy liên hệ với tôi qua email: victorpublic0000@gmail.com
