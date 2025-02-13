import 'package:flutter/material.dart';
import 'package:widgets_test/models/main_menu.dart';

class MainMenuController extends ChangeNotifier {
  bool isSidebarOpened = false;

  void setSidebarStatus() {
    isSidebarOpened = !isSidebarOpened;
    notifyListeners();
  }

  final List<MainMenu> listMenu = [
    MainMenu(
        title: "ป้ายประชาสัมพันธ์",
        icon: Icons.announcement_rounded,
        isSidebarOpen: false,
        IsFavorite: false),
    MainMenu(
      title: "ป้ายข้อความกำกับช่องทางเดินรถ",
      icon: Icons.streetview_rounded,
      IsFavorite: false,
    ),
    MainMenu(
      title: "ไฟชี้ช่องทาง",
      icon: Icons.upgrade_rounded,
      IsFavorite: false,
    ),
    MainMenu(
      title: "ตรวจจับความเร็ว",
      icon: Icons.speed_rounded,
      IsFavorite: false,
    ),
    MainMenu(
      title: "ตรวจสอบความหนาแน่นรถ",
      icon: Icons.car_crash_rounded,
      IsFavorite: false,
    ),
    MainMenu(
      title: "นับยานพาหนะ",
      icon: Icons.confirmation_number_rounded,
      IsFavorite: false,
    ),
    MainMenu(
      title: "โคมอัจฉริยะ",
      icon: Icons.lightbulb_circle_rounded,
      IsFavorite: false,
    ),
    MainMenu(
      title: "ชุดตรวจสอบความปลอดภัย",
      icon: Icons.videocam,
      IsFavorite: false,
    ),
    MainMenu(
      title: "ตรวจวัดน้ำหนักรถ",
      icon: Icons.line_weight_rounded,
      IsFavorite: false,
    ),
  ];
}
