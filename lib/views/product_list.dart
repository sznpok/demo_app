import 'package:demo_app/constant/colors.dart';
import 'package:demo_app/constant/values.dart';
import 'package:demo_app/model/menu_model.dart';
import 'package:demo_app/widgets/header.dart';
import 'package:demo_app/widgets/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  final String? title;
  final List<SubMenu>? subMenu;

  ProductList({this.title, this.subMenu});

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  int? _currentIndex;

  int count = 1;

  void _increment() {
    count = count + 1;
    setState(() {});
  }

  void _decrement() {
    count = count - 1;
    if (count <= 1) {
      count = 1;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: PADDING * 2,
          ),
          Padding(
            padding: const EdgeInsets.all(PADDING),
            child: HeaderAppBar(
              widget: Text(
                widget.title!,
                style: TextStyle(
                  fontSize: MAIN_TEXT + 8.0,
                  color: BLUE,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backIcon: true,
              profileIcon: false,
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (c, i) {
                return SizedBox(
                  height: PADDING / 2,
                );
              },
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: PADDING,
              ),
              itemBuilder: (c, i) {
                return ListItem(
                  image: widget.subMenu![i].image,
                  countItem: '2',
                  price: '100',
                  title: widget.subMenu![i].name,
                  saveButton: Material(
                    borderRadius: BorderRadius.circular(RADIUS),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          _currentIndex = i;
                          setState(() {});
                        },
                        child: Icon(
                          _currentIndex == i
                              ? CupertinoIcons.heart_fill
                              : CupertinoIcons.heart,
                          color: BLUE,
                        ),
                      ),
                    ),
                    color: WHITE,
                  ),
                  child: Material(
                    color: WHITE,
                    borderRadius: BorderRadius.circular(RADIUS * 4),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: PADDING / 2,
                        vertical: PADDING / 2.5,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              _decrement();
                            },
                            child: Icon(
                              CupertinoIcons.minus,
                              size: PADDING + 4.0,
                              color: BLUE,
                            ),
                          ),
                          SizedBox(
                            width: PADDING / 2,
                          ),
                          Text(
                            count.toString(),
                            style: TextStyle(
                              color: BLACK,
                              fontSize: SUB_TEXT,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: PADDING / 2,
                          ),
                          InkWell(
                            onTap: () {
                              _increment();
                            },
                            child: Icon(
                              CupertinoIcons.plus,
                              size: PADDING + 4.0,
                              color: BLUE,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: widget.subMenu!.length,
            ),
          )
        ],
      ),
    );
  }
}
