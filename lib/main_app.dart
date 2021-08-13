import 'package:demo_app/views/menu_view.dart';
import 'package:demo_app/views/profile_view.dart';
import 'package:demo_app/views/web_view.dart';

import 'package:demo_app/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainApp extends StatefulWidget {
  @override
  _MainApp createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return CustomBottomNavBar(
      currentIndex: index,
      onTap: (i) => setState(() => index = i),
      pages: [
        MenuView(),
        WebViewScreen(),
        ProfileView(),
      ],
    );
  }
}
