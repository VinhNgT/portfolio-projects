import 'package:flutter/services.dart';

enum AppFlavor {
  dev,
  prod;
}

bool appBuiltWithFlavor(AppFlavor flavor) {
  return appFlavor == flavor.name;
}
