import 'package:demo_app/constant/colors.dart';
import 'package:demo_app/constant/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HeaderAppBar extends StatelessWidget {
  final Widget widget;
  final bool backIcon;
  final bool profileIcon;
  final Color? color;

  HeaderAppBar(
      {required this.widget,
      required this.backIcon,
      this.color,
      required this.profileIcon});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (backIcon == true)
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: color,
                ),
              ),
            Expanded(child: SizedBox()),
            if (profileIcon == true)
              CircleAvatar(
                backgroundColor: BLUE,
                radius: RADIUS * 3,
                backgroundImage: AssetImage('images/sijan.jpg'),
              )
          ],
        ),
        (backIcon == true || profileIcon == true)
            ? SizedBox(
                height: PADDING / 2,
              )
            : SizedBox(
                height: 0,
              ),
        widget,
      ],
    );
  }
}
