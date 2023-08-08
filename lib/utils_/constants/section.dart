import 'package:intl/intl.dart';

getDateStart(String date) {
  DateTime dateTimeStart = DateTime.parse(date);
  //return DateFormat('d MMMM', 'fr_FR').format(dateTimeStart);
  return DateFormat('MMMM', 'fr_FR').format(dateTimeStart);
}

getDateEnd(String date) {
  DateTime dateTimeEnd = DateTime.parse(date);
  return DateFormat('MMMM', 'fr_FR').format(dateTimeEnd);
  //return DateFormat('d MMMM', 'fr_FR').format(dateTimeEnd);
}
