import 'dart:async';

import 'package:driving_license/common_widgets/alert_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      unawaited(
        showExceptionAlertDialog(
          context: context,
          title: 'Error',
          exception: error,
        ),
      );
    }
  }
}
