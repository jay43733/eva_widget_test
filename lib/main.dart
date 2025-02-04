import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_test/screens/homepage.dart';
import 'package:widgets_test/widgets/appBar.dart';

void main() {
  runApp(MyApp());
}

enum SampleItem { Thai, English }

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => Scaffold(
          backgroundColor: Color(0xFFf5f5f5),
          appBar: AppBarScreen(),
          body: Center(
            child: const Homepage(),
          ),
        ),
      ),
      // Add more routes here as needed
    ],
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData(color: Colors.black),
        useMaterial3: true,
      ),
      routerConfig: _router,
      scrollBehavior: CustomScrollBehavior(),
    );
  }
}
