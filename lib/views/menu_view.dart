import 'dart:convert';

import 'package:demo_app/constant/colors.dart';
import 'package:demo_app/constant/values.dart';
import 'package:demo_app/model/menu_model.dart';
import 'package:demo_app/widgets/header.dart';
import 'package:demo_app/widgets/product.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MenuView extends StatefulWidget {
  @override
  _MenuViewState createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  int _selectedIndex = 0;
  ScrollController scrollController = ScrollController();

  Future<List<Product>> readJson() async {
    final jsondata = await rootBundle.loadString('json/product.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Product.fromJson(e)).toList();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: PADDING,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: PADDING * 2,
            ),
            HeaderAppBar(
              widget: Text(
                'Menu Dashboard',
                style: TextStyle(
                  fontSize: MAIN_TEXT + 8.0,
                  color: BLUE,
                ),
              ),
              backIcon: false,
              profileIcon: true,
            ),
            SizedBox(
              height: PADDING / 2,
            ),
            FutureBuilder(
              future: readJson(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (data.hasData) {
                  var items = data.data as List<Product>;
                  return Expanded(
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: PADDING * 6,
                          height: MediaQuery.of(context).size.height,
                          child: Material(
                            color: BLUE.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(RADIUS),
                            child: ScrollConfiguration(
                              behavior: ScrollBehavior(),
                              child: Scrollbar(
                                isAlwaysShown: true,
                                thickness: 5,
                                radius: Radius.circular(RADIUS * 2),
                                controller: scrollController,
                                child: ListView.builder(
                                    controller: scrollController,
                                    itemCount: items.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.all(PADDING / 3),
                                    itemBuilder: (c, i) {
                                      return GestureDetector(
                                          onTap: () {
                                            _selectedIndex = i;
                                            setState(() {});
                                          },
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(RADIUS)),
                                              side: BorderSide(
                                                color: BLUE,
                                                width: 3,
                                                style: _selectedIndex == i
                                                    ? BorderStyle.solid
                                                    : BorderStyle.none,
                                              ),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  _selectedIndex = i;
                                                });
                                              },
                                              child: Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      PADDING / 2),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: <Widget>[
                                                      SizedBox(
                                                        height: 60,
                                                        width: 80,
                                                        child: DecoratedBox(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              RADIUS,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(
                                                              PADDING / 2,
                                                            ),
                                                            child: Image.asset(
                                                              'images/w1.png',
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Text(
                                                        items[i].name!,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: SUB_TEXT,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ));
                                    }),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(PADDING / 2),
                                child: Text(
                                  items[_selectedIndex].name!,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: BLUE,
                                    fontSize: MAIN_TEXT,
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: BLUE,
                                endIndent: 10,
                                indent: 10,
                              ),
                              Expanded(
                                child: GridView.builder(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: PADDING / 2),
                                  shrinkWrap: true,
                                  itemCount:
                                      items[_selectedIndex].subMenu!.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.9,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                  ),
                                  itemBuilder: (c, i) {
                                    return ProductView(
                                      subMenu:
                                          items[_selectedIndex].subMenu![i],
                                      list: items[_selectedIndex].subMenu,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
