import 'package:flutter/material.dart';

class LeftDrawerBannerMenu {
  final String title;
  final IconData? icon;
  final String? route;
  final String? subtitle;

  LeftDrawerBannerMenu(
      {this.route, required this.title, this.icon, this.subtitle});
}

List<LeftDrawerBannerMenu> listOfLeftDrawerBannerMenu = [
  LeftDrawerBannerMenu(
    title: "ป้ายประชาสัมพันธ์",
    icon: Icons.panorama_wide_angle_rounded,
  ),
  LeftDrawerBannerMenu(
      title: "ที่ตั้งอุปกรณ์", route: "location", subtitle: "ทช. ระยอง"),
  LeftDrawerBannerMenu(
      title: "จัดการป้ายประชาสัมพันธ์",
      route: "message_manage",
      icon: Icons.settings,
      subtitle: "ข้อความ"),
  LeftDrawerBannerMenu(
      title: "รายงาน", route: "report", icon: Icons.insert_drive_file),
  LeftDrawerBannerMenu(
      title: "แดชบอร์ด", route: "dashboard", icon: Icons.timeline),
  LeftDrawerBannerMenu(
      title: "แผนที่",
      route: "map",
      icon: Icons.map,
      subtitle: "ที่ตั้งอุปกรณ์"),
];
