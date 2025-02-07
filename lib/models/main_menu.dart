import 'package:flutter/material.dart';

class MainMenu {
  final String title;
  final IconData icon;
  bool? haveDrawer;
  bool IsFavorite;

  MainMenu(
      {required this.title,
      required this.icon,
      this.haveDrawer = false,
      required this.IsFavorite});
}

