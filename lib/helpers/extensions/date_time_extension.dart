extension DateTimeExtension on DateTime {
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

  ///Tells if the this date on the same day as the given date.
  bool isOnSameDayAs(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  ///Tells if the this date occurs before the given date. Differs from
  ///[isBefore] in that it will return true if the two dates are on the
  ///same day.
  bool isBeforeDayOf(DateTime other) {
    return year < other.year ||
        (year == other.year && month < other.month) ||
        (year == other.year && month == other.month && day < other.day);
  }

  ///Tells if the this date occurs after the given date. Differs from
  ///[isAfter] in that it will return true if the two dates are on the
  ///same day.
  bool isAfterDayOf(DateTime other) {
    return year > other.year ||
        (year == other.year && month > other.month) ||
        (year == other.year && month == other.month && day > other.day);
  }
}
