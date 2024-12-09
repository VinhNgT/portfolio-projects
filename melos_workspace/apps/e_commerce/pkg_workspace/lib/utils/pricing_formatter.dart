import 'package:intl/intl.dart';

abstract class PricingUtils {
  static final vndPriceFormatter = NumberFormat.currency(
    locale: 'vi_VN',
    symbol: '₫',
    decimalDigits: 0,
    customPattern: '¤#,###',
  );
}
