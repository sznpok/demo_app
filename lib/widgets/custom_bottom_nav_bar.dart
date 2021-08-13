import 'package:demo_app/constant/colors.dart';
import 'package:demo_app/constant/values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<Widget> pages;

  CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.pages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: WHITE,
      child: Scaffold(
        body: pages[currentIndex],
        backgroundColor: BLUE.withOpacity(0.1),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(RADIUS * 2.0),
            topRight: Radius.circular(RADIUS * 2.0),
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: BLUE,
            elevation: ELEVATION,
            unselectedItemColor: WHITE,
            iconSize: PADDING + 4.0,
            selectedItemColor: WHITE,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.space_dashboard_outlined,
                ),
                label: 'MENU',
                activeIcon: CircleAvatar(
                  child: Icon(
                    Icons.space_dashboard,
                  ),
                  backgroundColor: WHITE,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.web_outlined,
                ),
                label: 'WEB VIEW',
                activeIcon: CircleAvatar(
                  child: Icon(
                    Icons.web,
                  ),
                  backgroundColor: WHITE,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
                label: 'PROFILE',
                activeIcon: CircleAvatar(
                  child: Icon(
                    CupertinoIcons.person_fill,
                  ),
                  backgroundColor: WHITE,
                ),
              ),
            ],
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}

class BottomNavBar {
  String? title;
  Icon? icon;
  BottomNavBar({this.title, this.icon});
}
