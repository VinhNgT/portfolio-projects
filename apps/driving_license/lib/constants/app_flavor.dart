import 'package:flutter/services.dart';

enum AppFlavor {
  dev,
  prod;
}

bool isAppBuiltWithFlavor(AppFlavor flavor) {
  return appFlavor == flavor.name;
}
