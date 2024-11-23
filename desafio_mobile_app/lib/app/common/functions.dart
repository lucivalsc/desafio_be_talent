String formatDate(String date) {
  try {
    final dateParts = date.split('T')[0].split('-');
    if (dateParts.length != 3) return date;

    final year = dateParts[0];
    final month = dateParts[1];
    final day = dateParts[2];

    return "$day/$month/$year";
  } catch (e) {
    return date;
  }
}

String formatPhone(String phone) {
  if (phone.length < 12) return phone;

  final countryCode = phone.substring(0, 2);
  final ddd = phone.substring(2, 4);
  final firstPart = phone.length == 13 ? phone.substring(4, 9) : phone.substring(4, 8);
  final secondPart = phone.length == 13 ? phone.substring(9) : phone.substring(8);

  return "+$countryCode ($ddd) $firstPart-$secondPart";
}
