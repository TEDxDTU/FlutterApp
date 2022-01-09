extension DateTimeCopyWithExtension on DateTime {
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
  }) {
    return DateTime(
        year ?? this.year,
        month ?? this.month,
        day ?? this.day,
        hour ?? this.hour,
        minute ?? this.minute,
        second ?? this.second,
        millisecond ?? this.millisecond);
  }

  bool isOnSameDayAs(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  bool isBeforeDayOf(DateTime other) {
    return year < other.year ||
        (year == other.year && month < other.month) ||
        (year == other.year && month == other.month && day < other.day);
  }

  bool isAfterDayOf(DateTime other) {
    return year > other.year ||
        (year == other.year && month > other.month) ||
        (year == other.year && month == other.month && day > other.day);
  }
}
