import 'package:driving_license/exceptions/app_exception.dart';

abstract class AppBillingException extends AppException {
  const AppBillingException(super.message);
}

class UserCanceledException extends AppBillingException {
  const UserCanceledException(this.productId)
      : super('User canceled the purchase of $productId');
  final String productId;
}
