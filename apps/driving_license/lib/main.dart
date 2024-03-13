import 'package:driving_license/bootstrap.dart';
import 'package:flutter/material.dart';

void main() async {
  // Firebase needs this to be called before runApp
  WidgetsFlutterBinding.ensureInitialized();

  final app = await Bootstrap.initApp();
  // ignore: missing_provider_scope
  runApp(app);
}
