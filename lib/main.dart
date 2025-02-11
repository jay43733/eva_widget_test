import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_test/app.dart';
import 'package:widgets_test/constants/custom_scroll_behavior.dart';
import 'package:widgets_test/controllers/announcement_controller.dart';
import 'package:widgets_test/controllers/app_bar_controller.dart';
import 'package:widgets_test/controllers/main_menu_controller.dart';
import 'package:widgets_test/controllers/home_controller.dart';
import 'package:widgets_test/theme/color.dart';

//Focus on Entry & State Management.
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AnnouncementController()),
      // Dependency Injection
      // ChangeNotifierProxyProvider is a special type of Provider that depends on another provider. It allows a ChangeNotifier class to receive and update data from another ChangeNotifier in the widget tree.
      //- When one provider (A) depends on another provider (B).
      // - When you want Provider B’s updates to automatically affect Provider A.
      // - When you need to pass data dynamically from one controller to another.

      ChangeNotifierProxyProvider<AnnouncementController, HomeController>(
          create: (context) => HomeController(announcementController: null),
          update: (context, announcementController, previousHomeController) {
            if (previousHomeController == null) {
              return HomeController(
                  announcementController: announcementController);
            }
            previousHomeController.updateController(announcementController);
            return previousHomeController;
          }),

      ChangeNotifierProvider(create: (_) => AppBarController()),
      ChangeNotifierProvider(create: (_) => MainMenuController()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: App(),
      debugShowCheckedModeBanner: false,
      title: 'Eva Project Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: AppColor.blackPrimary),
        useMaterial3: true,
      ),
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
