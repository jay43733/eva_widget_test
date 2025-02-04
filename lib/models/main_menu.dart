import 'package:flutter/material.dart';

class MainMenu {
  final String title;
  final IconData icon;

  MainMenu({
    required this.title,
    required this.icon,
  });
}

List<MainMenu> listMenu = [
  MainMenu(
    title: "ป้ายประชาสัมพันธ์",
    icon: Icons.announcement_rounded,
  ),
  MainMenu(
    title: "ป้ายข้อความกำกับช่องทางเดินรถ",
    icon: Icons.streetview_rounded,
  ),
  MainMenu(
    title: "ไฟชี้ช่องทาง",
    icon: Icons.upgrade_rounded,
  ),
  MainMenu(
    title: "ตรวจจับความเร็ว",
    icon: Icons.speed_rounded,
  ),
  MainMenu(
    title: "ตรวจสอบความหนาแน่นรถ",
    icon: Icons.car_crash_rounded,
  ),
  MainMenu(
    title: "นับยานพาหนะ",
    icon: Icons.confirmation_number_rounded,
  ),
  MainMenu(
    title: "โคมอัจฉริยะ",
    icon: Icons.lightbulb_circle_rounded,
  ),
  MainMenu(
    title: "ชุดตรวจสอบความปลอดภัย",
    icon: Icons.videocam,
  ),
  MainMenu(
    title: "ตรวจวัดน้ำหนักรถ",
    icon: Icons.line_weight_rounded,
  ),
];
