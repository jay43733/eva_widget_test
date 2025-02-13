import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReportDataController extends ChangeNotifier {
  String startDate = '';
  String endDate = '';

  void setStartDate(DateTime selectedDate) {
    final dateFormat = DateFormat('MM/dd/yyyy');
    final timeFormat = DateFormat('HH:mm a');
    startDate =
        "${dateFormat.format(selectedDate)} ${timeFormat.format(selectedDate)}";
    print("Controllerrrrrrrr: $startDate");
    notifyListeners();
  }

  void setEndDate(DateTime selectedDate) {
    final dateFormat = DateFormat('MM/dd/yyyy');
    final timeFormat = DateFormat('HH:mm a');
    endDate =
        "${dateFormat.format(selectedDate)} ${timeFormat.format(selectedDate)}";
    print("Controllerrrrrrr: $endDate");
    notifyListeners();
  }
}
