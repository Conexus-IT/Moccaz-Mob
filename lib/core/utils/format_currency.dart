import 'package:intl/intl.dart';

String formatCurrency(double price) {
  var format = NumberFormat("#,##0.00", "fr"); // "fr" is for French locale
  String formattedPrice = format.format(price);

  // Replace the dot with a comma
  formattedPrice = formattedPrice.replaceAll('.', ',');

  return formattedPrice;
}
