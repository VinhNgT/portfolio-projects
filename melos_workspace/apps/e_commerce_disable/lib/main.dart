import 'package:e_commerce/bootstrap/bootstrap.dart';
import 'package:e_commerce/bootstrap/bootstrap_delegate.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const bootstrap = Bootstrap(ProductionBootstrapDelegate());
  final app = await bootstrap.initApp();
  runApp(app);
}
