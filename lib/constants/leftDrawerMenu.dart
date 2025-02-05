import 'package:flutter/material.dart';

class LeftDrawerMenu {
  final String title;
  final IconData? icon;
  final String? subtitle;

  LeftDrawerMenu({required this.title, this.icon, this.subtitle});
}

List<LeftDrawerMenu> listOfLeftDrawerMenu = [
  LeftDrawerMenu(
    title: "ป้ายประชาสัมพันธ์",
    icon: Icons.panorama_wide_angle_rounded,
  ),
  LeftDrawerMenu(title: "ที่ตั้งอุปกรณ์", subtitle: "ทช. ระยอง"),
  LeftDrawerMenu(
      title: "จัดการป้ายประชาสัมพันธ์",
      icon: Icons.settings,
      subtitle: "ข้อความ"),
  LeftDrawerMenu(title: "รายงาน", icon: Icons.insert_drive_file),
  LeftDrawerMenu(title: "แดชบอร์ด", icon: Icons.timeline),
  LeftDrawerMenu(title: "แผนที่", icon: Icons.map, subtitle: "ที่ตั้งอุปกรณ์"),
];
