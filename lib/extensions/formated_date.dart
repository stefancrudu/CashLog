extension FormatedDate on DateTime {
  int get formatedToDatabase => dateOnly().millisecondsSinceEpoch;

  String get toStringDate =>
      '${_formatNumberWithTwoDigits(day)}.${_formatNumberWithTwoDigits(month)}.$year';
  DateTime dateOnly() => DateTime(year, month, day);

  String _formatNumberWithTwoDigits(int number) {
    return number < 9 ? '0$number' : number.toString();
  }
}
