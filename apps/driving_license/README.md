# Drive Ready

Ứng dụng ôn tập lý thuyết cho các loại giấy phép lái xe hạng A, B

## Giới thiệu

Drive Ready là một ứng dụng di động giúp người dùng ôn tập kiến thức lý thuyết để chuẩn bị cho kỳ thi giấy phép lái xe hạng A và B. Ứng dụng cung cấp các câu hỏi trắc nghiệm và tài liệu học để người dùng có thể nắm vững kiến thức cần thiết.

## Cài đặt

Để chạy ứng dụng, làm theo các bước sau:

1. Clone repository này về máy của bạn.
2. Mở terminal và di chuyển đến thư mục chứa mã nguồn của ứng dụng.
3. Chạy lệnh `flutter pub get` để cài đặt các phụ thuộc cần thiết.
4. Chạy lệnh `flutter run` để khởi chạy ứng dụng trên thiết bị hoặc máy ảo.

## Yêu cầu hệ thống

Để chạy ứng dụng, bạn cần có các yêu cầu hệ thống sau:

- Flutter SDK phiên bản 3.2.6 trở lên.
- Android Studio hoặc IntelliJ IDEA / VS Code với plugin Flutter.
- Thiết bị Android hoặc máy ảo Android để chạy ứng dụng.

## Xây dựng từ mã nguồn

Nếu bạn muốn xây dựng ứng dụng từ mã nguồn, làm theo các bước sau:

1. Mở terminal và di chuyển đến thư mục chứa mã nguồn của ứng dụng.
2. Chạy lệnh `flutter build apk` để xây dựng ứng dụng thành file app APK.

## Xây dựng từ mã nguồn để phát hành trên Play Store

- Tạo `upload-keystore.jks` theo hướng dẫn tại:

  https://docs.flutter.dev/deployment/android#create-an-upload-keystore

- Tạo thư mục mới `/keys` tại thư mục gốc
- Đưa `upload-keystore.jks` cho vào thư mục `/keys`
- Tạo file `key.properties` tại thư mục `/android` theo mẫu sau:

  ```properties
  storePassword=password0
  keyPassword=password0
  keyAlias=upload
  storeFile=keys/upload-keystore.jks
  ```

- Xây dựng ứng dụng thành file app bundle sử dụng lệnh:

  ```powershell
  flutter build appbundle --obfuscate --split-debug-info=build_obfuscation --extra-gen-snapshot-options=--save-obfuscation-map=build_obfuscation/app.obfuscation.map.json
  ```

  - Kết quả app bundle tại đường dẫn:

    `apps/driving_license/build/app/outputs/bundle/release/app-release.aab`

  - Các file để de-obfuscation nằm trong folder `build_obfuscation`

## Liên hệ

Nếu bạn có bất kỳ câu hỏi hoặc góp ý nào, hãy liên hệ với tôi qua email: victorpublic0000@gmail.com
