import 'package:flutter/material.dart';
import 'package:widgets_test/controllers/announcement_controller.dart';
import 'package:widgets_test/models/announcement.dart';

class HomeController extends ChangeNotifier {
  //if A controller depends on another one, we need to use 'Dependency Injection' like creating props for receiving another component.
  //******* NEED TO UPDATE IN PROVIDER IN MAIN.DART *************
  AnnouncementController? announcementController;
  HomeController({
    this.announcementController,
  });

  // if variable's name has _ (underscore) or use 'static' / 'const' in front of name, it is private variable and cannot be applied for outside.
  static const int itemPerPage = 6;
  int currentPage = 0;
  void updateController(AnnouncementController newController) {
    announcementController = newController;
    notifyListeners();
  }

  List<Announcement> get getPaginatedNews {
    int startIndex = currentPage * itemPerPage;
    int endIndex = startIndex + itemPerPage;
    return announcementController!.listOfNews.sublist(startIndex,
        endIndex.clamp(0, announcementController!.listOfNews.length));
  }

  void changePage(int newPage) {
    currentPage = newPage;
    notifyListeners();
  }
}
