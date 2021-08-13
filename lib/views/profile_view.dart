import 'package:demo_app/constant/colors.dart';
import 'package:demo_app/constant/values.dart';
import 'package:demo_app/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(PADDING),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: PADDING * 2,
            ),
            HeaderAppBar(
              widget: Text(
                'PROFILE',
                style: TextStyle(
                  fontSize: MAIN_TEXT + 8,
                  color: BLUE,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backIcon: false,
              profileIcon: false,
            ),
            SizedBox(
              height: PADDING,
            ),
            Container(
              height: PADDING * 8,
              width: PADDING * 8,
              child: Stack(
                children: [
                  SizedBox(
                    height: PADDING * 7,
                    width: PADDING * 7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        RADIUS * 4,
                      ),
                      child: Image.asset(
                        'images/sijan.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: SizedBox(
                      height: PADDING * 2,
                      width: PADDING * 2,
                      child: Material(
                        color: BLUE,
                        borderRadius: BorderRadius.circular(RADIUS),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.camera,
                            color: WHITE,
                            size: PADDING,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: PADDING / 3,
            ),
            Text(
              'Kendric Lamar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: BLACK,
                fontSize: MAIN_TEXT,
              ),
            ),
            Text(
              '98876543210',
              style: TextStyle(
                fontSize: SUB_TEXT,
                color: GREY,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: PADDING,
            ),
            Material(
              color: WHITE,
              borderRadius: BorderRadius.circular(RADIUS),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(PADDING / 2),
                    child: InkWell(
                      onTap: () {},
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            child: Padding(
                              padding: const EdgeInsets.all(PADDING / 3),
                              child: Icon(
                                CupertinoIcons.person,
                                color: BLACK,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(RADIUS),
                            color: BLUE.withOpacity(0.1),
                          ),
                          SizedBox(
                            width: PADDING / 2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Personal Details',
                                style: TextStyle(
                                  fontSize: SUB_TEXT,
                                  fontWeight: FontWeight.w800,
                                  color: BLACK,
                                ),
                              ),
                              SizedBox(
                                height: PADDING / 3,
                              ),
                              Text(
                                'Username, password,email,address',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: SMALL_TEXT,
                                  color: GREY,
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Icon(
                            CupertinoIcons.forward,
                            color: BLACK,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: BLUE.withOpacity(0.1),
                    thickness: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(PADDING / 2),
                    child: InkWell(
                      onTap: () {},
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            child: Padding(
                              padding: const EdgeInsets.all(PADDING / 3),
                              child: Icon(
                                Icons.history,
                                color: BLACK,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(RADIUS),
                            color: BLUE.withOpacity(0.1),
                          ),
                          SizedBox(
                            width: PADDING / 2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order',
                                style: TextStyle(
                                  fontSize: SUB_TEXT,
                                  fontWeight: FontWeight.w800,
                                  color: BLACK,
                                ),
                              ),
                              SizedBox(
                                height: PADDING / 3,
                              ),
                              Text(
                                'Order details',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: SMALL_TEXT,
                                  color: GREY,
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Icon(
                            CupertinoIcons.forward,
                            color: BLACK,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: BLUE.withOpacity(0.1),
                    thickness: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(PADDING / 2),
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Material(
                          child: Padding(
                            padding: const EdgeInsets.all(PADDING / 3),
                            child: Icon(
                              Icons.payment,
                              color: BLACK,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(RADIUS),
                          color: BLUE.withOpacity(0.1),
                        ),
                        SizedBox(
                          width: PADDING / 2,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Payment Card',
                              style: TextStyle(
                                fontSize: SUB_TEXT,
                                fontWeight: FontWeight.w800,
                                color: BLACK,
                              ),
                            ),
                            SizedBox(
                              height: PADDING / 3,
                            ),
                            Text(
                              'Add bank details',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: SMALL_TEXT,
                                color: GREY,
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Icon(
                          CupertinoIcons.forward,
                          color: BLACK,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: BLUE.withOpacity(0.1),
                    thickness: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(PADDING / 2),
                    child: InkWell(
                      onTap: () {},
                      child: Flex(
                        direction: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            child: Padding(
                              padding: const EdgeInsets.all(PADDING / 3),
                              child: Stack(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    color: BLACK,
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Material(
                                      child: Text(
                                        '10',
                                        style: TextStyle(
                                          fontSize: SMALL_TEXT - 2,
                                          color: WHITE,
                                        ),
                                      ),
                                      color: RED,
                                      borderRadius:
                                          BorderRadius.circular(RADIUS / 2),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            borderRadius: BorderRadius.circular(RADIUS),
                            color: BLUE.withOpacity(0.1),
                          ),
                          SizedBox(
                            width: PADDING / 2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Notifications',
                                style: TextStyle(
                                  fontSize: SUB_TEXT,
                                  fontWeight: FontWeight.w800,
                                  color: BLACK,
                                ),
                              ),
                              SizedBox(
                                height: PADDING / 3,
                              ),
                              Text(
                                'News,notifications',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: SMALL_TEXT,
                                  color: GREY,
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Icon(
                            CupertinoIcons.forward,
                            color: BLACK,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: PADDING,
            ),
            SizedBox(
              height: PADDING * 3,
              child: Material(
                color: BLUE,
                borderRadius: BorderRadius.circular(RADIUS),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout,
                        color: WHITE,
                      ),
                      SizedBox(
                        width: PADDING / 3,
                      ),
                      Text(
                        'Log out',
                        style: TextStyle(
                          color: WHITE,
                          fontSize: SUB_TEXT,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
