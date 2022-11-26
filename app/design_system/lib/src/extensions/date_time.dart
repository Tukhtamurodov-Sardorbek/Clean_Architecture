import 'package:core/core.dart';

extension DateHelper on DateTime {
  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  String formatDate([String pattern = 'dd MMMM, y']) {
    final currentYear = DateTime.now().year;
    final isDifferentYear = currentYear != year;
    final dateFormatter =
    isDifferentYear && !pattern.contains('y') && !pattern.contains('Y')
        ? '$pattern, y'
        : pattern;
    final formatter = DateFormat(dateFormatter, LocaleKeys.lang.tr());
    return formatter.format(this);
  }

  String nameDate([String pattern = 'dd MMMM, y']) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateToCheck = DateTime(year, month, day);

    if (dateToCheck == today) {
      return LocaleKeys.today.tr();
    } else if (dateToCheck == yesterday) {
      return LocaleKeys.yesterday.tr();
    }
    return formatDate(pattern);
  }
}
