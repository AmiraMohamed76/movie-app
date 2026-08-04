import 'package:intl/intl.dart';

extension DateFormatting on String {
  String toFormattedDate() {
    final date = DateTime.parse(this);
    return DateFormat('MMM dd, yyyy').format(date);
  }
}