import 'package:intl/intl.dart';

class FormatCurrentDate{
   String formatedDate(String dateTime){

  return DateFormat('d-M-yyy').format(DateTime.parse(dateTime));

   }
}