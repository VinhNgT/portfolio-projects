import 'dart:async';

import 'package:e_commerce/backend/env/env_provider.dart';
import 'package:e_commerce/bootstrap/bootstrap.dart';
import 'package:e_commerce/bootstrap/bootstrap_delegate.dart';
import 'package:e_commerce/features/mocking/service/mock_data_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const bootstrap = Bootstrap(ProductionBootstrapDelegate());
  final app = await bootstrap.initApp();
  runApp(app);

  final envData = app.container.read(envProvider);
  if (envData.fillLocalDatabaseWithTestDataOnStartup) {
    unawaited(_fillMockData(app.container));
  }
}

Future<void> _fillMockData(ProviderContainer container) async {
  final mockDataService = container.read(mockDataServiceProvider);
  await mockDataService.fillCart();
}
