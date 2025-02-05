import 'package:flutter/material.dart';

class LeftDrawerMenu {
  final String title;
  final IconData? icon;
  final String route;
  final String? subtitle;

  LeftDrawerMenu(
      {required this.route, required this.title, this.icon, this.subtitle});
}

List<LeftDrawerMenu> listOfLeftDrawerMenu = [
  LeftDrawerMenu(
    title: "ป้ายประชาสัมพันธ์",
    route: "banner",
    icon: Icons.panorama_wide_angle_rounded,
  ),
  LeftDrawerMenu(
      title: "ที่ตั้งอุปกรณ์", route: "location", subtitle: "ทช. ระยอง"),
  LeftDrawerMenu(
      title: "จัดการป้ายประชาสัมพันธ์",
      route: "message_manage",
      icon: Icons.settings,
      subtitle: "ข้อความ"),
  LeftDrawerMenu(
      title: "รายงาน", route: "report", icon: Icons.insert_drive_file),
  LeftDrawerMenu(title: "แดชบอร์ด", route: "dashboard", icon: Icons.timeline),
  LeftDrawerMenu(
      title: "แผนที่",
      route: "map",
      icon: Icons.map,
      subtitle: "ที่ตั้งอุปกรณ์"),
];
