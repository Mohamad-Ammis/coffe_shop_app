
  import 'dart:developer';

import 'package:intl/intl.dart';

String formatDate(String date) {
    try {
      // تحويل النص إلى DateTime
      DateTime parsedDate = DateTime.parse(date);

      // تنسيق التاريخ إلى "09 Oct 2024"
      String formattedDate = DateFormat('dd MMM yyyy').format(parsedDate);

      return formattedDate;
    } catch (e) {
      log('Error parsing date: $e');
      return 'Invalid Date';
    }
  }