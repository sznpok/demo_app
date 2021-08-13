import 'package:demo_app/constant/colors.dart';
import 'package:demo_app/constant/values.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String? title;
  final Widget? saveButton;
  final Widget? child;
  final String? image;
  final String? countItem;
  final String? price;
  ListItem(
      {this.title,
      this.image,
      this.child,
      this.countItem,
      this.price,
      this.saveButton});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: BLUE.withOpacity(0.1),
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(RADIUS)),
      child: Padding(
        padding: const EdgeInsets.all(PADDING / 1.5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: PADDING * 5,
              width: PADDING * 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(RADIUS),
                child: Image.asset(
                  image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: PADDING,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title!,
                              style: TextStyle(
                                fontSize: MAIN_TEXT,
                                fontWeight: FontWeight.w500,
                                color: BLACK,
                              ),
                            ),
                            SizedBox(
                              height: PADDING / 2.5,
                            ),
                            Text(
                              'Rs.$price',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MAIN_TEXT,
                                color: BLACK,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      SizedBox(
                        height: PADDING * 2,
                        width: PADDING * 2,
                        child: saveButton,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: PADDING / 2,
                  ),
                  Row(
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(RADIUS * 2)),
                        onPressed: () {},
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(color: WHITE),
                        ),
                        color: BLUE,
                      ),
                      Expanded(child: SizedBox()),
                      child!,
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
