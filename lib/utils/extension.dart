import 'package:intl/intl.dart';

extension DoubleExtension on double {
  String getCurrency() {
    final formatter = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 2,
    );
    return formatter.format(this);
  }
}

extension IntExtension on int {
  String getCompact() => NumberFormat.compact().format(this);
}
