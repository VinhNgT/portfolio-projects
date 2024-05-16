import 'package:driving_license/bootstrap.dart';
import 'package:driving_license/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // Firebase needs this to be called before runApp
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final app = await Bootstrap.initApp();
  // ignore: missing_provider_scope
  runApp(app);
}
