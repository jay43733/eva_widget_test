import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppBarController extends ChangeNotifier {
  String dateNumber = '';
  String selectedLanguage = "Thai";
  Timer? _timer;

  AppBarController() {
    displayDateNow();
    _timer =
        Timer.periodic(const Duration(seconds: 1), (_) => displayDateNow());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  void displayDateNow() {
    final now = DateTime.now();
    final dateFormat = DateFormat("dd/MM/yyyy");
    final timeFormat = DateFormat('HH:mm:ss a'); //a is an indicator for AM/PM
    dateNumber = "${dateFormat.format(now)}, ${timeFormat.format(now)}";
    notifyListeners();
  }

  void updateLanguage(String language) {
    selectedLanguage = language;
    notifyListeners();
  }
}
