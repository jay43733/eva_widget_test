import 'package:flutter/material.dart';

class LeftDrawerBannerMenu {
  final String title;
  final IconData? icon;
  final String? route;
  List<LeftDrawerBannerMenu>? submenu;

  LeftDrawerBannerMenu(
      {this.route, required this.title, this.icon, this.submenu});
}

List<LeftDrawerBannerMenu> listOfLeftDrawerBannerMenu = [
  LeftDrawerBannerMenu(
      title: "ป้ายประชาสัมพันธ์",
      icon: Icons.panorama_wide_angle_rounded,
      submenu: [
        LeftDrawerBannerMenu(title: "ที่ตั้งอุปกรณ์", submenu: [
          LeftDrawerBannerMenu(title: "ทช.ระยอง", submenu: [
            LeftDrawerBannerMenu(title: "มานตาพุต", submenu: [
              LeftDrawerBannerMenu(title: "จุดที่ 1", submenu: [
                LeftDrawerBannerMenu(
                  title: "VMS1 (PR)",
                ),
                LeftDrawerBannerMenu(
                  title: "VMS2 (PR)",
                ),
                LeftDrawerBannerMenu(
                  title: "VMS3 (PR)",
                ),
              ]),
              LeftDrawerBannerMenu(
                title: "จุดที่ 2",
              ),
              LeftDrawerBannerMenu(
                title: "จุดที่ 3",
              ),
              LeftDrawerBannerMenu(
                title: "จุดที่ 4",
              ),
            ]),
            LeftDrawerBannerMenu(
              title: "แม่รำพึง",
            ),
          ]),
          LeftDrawerBannerMenu(
            title: "ทช. เชียงใหม่",
          ),
          LeftDrawerBannerMenu(
            title: "อบจ. ราชบุรี",
          ),
        ]),
      ],
      route: ""),
  LeftDrawerBannerMenu(
      title: "จัดการป้ายประชาสัมพันธ์",
      route: "message_manage",
      icon: Icons.settings,
      submenu: [
        LeftDrawerBannerMenu(
          title: "ข้อความ",
        ),
        LeftDrawerBannerMenu(
          title: "ชุดข้อความ",
        ),
        LeftDrawerBannerMenu(
          title: "รูปแบบหน้าจอ",
        ),
      ]),
  LeftDrawerBannerMenu(
      title: "รายงาน", route: "report", icon: Icons.insert_drive_file),
  LeftDrawerBannerMenu(
      title: "แดชบอร์ด", route: "dashboard", icon: Icons.timeline),
  LeftDrawerBannerMenu(
      title: "แผนที่",
      route: "map",
      icon: Icons.map,
      submenu: [
        LeftDrawerBannerMenu(title: "ที่ตั้งอุปกรณ์", submenu: [
          LeftDrawerBannerMenu(title: "ทช.ระยอง", submenu: [
            LeftDrawerBannerMenu(title: "มานตาพุต", submenu: [
              LeftDrawerBannerMenu(
                title: "จุดที่ 1",
              ),
              LeftDrawerBannerMenu(
                title: "จุดที่ 2",
              ),
              LeftDrawerBannerMenu(
                title: "จุดที่ 3",
              ),
            ]),
            LeftDrawerBannerMenu(
              title: "แม่รำพึง",
            ),
          ]),
          LeftDrawerBannerMenu(
            title: "ทช. เชียงใหม่",
          ),
          LeftDrawerBannerMenu(
            title: "อบจ. ราชบุรี",
          ),
        ]),
      ]),
];
