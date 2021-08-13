import 'package:demo_app/constant/colors.dart';
import 'package:demo_app/constant/values.dart';
import 'package:demo_app/model/menu_model.dart';
import 'package:demo_app/views/product_list.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final SubMenu? subMenu;
  final List<SubMenu>? list;

  ProductView({this.subMenu, this.list});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductList(
              title: subMenu!.name,
              subMenu: list,
            ),
          ),
        );
      },
      child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(RADIUS))),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: PADDING * 4,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(RADIUS),
                  child: Image.asset(
                    subMenu!.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: PADDING,
              ),
              Expanded(
                  child: Text(
                subMenu!.name!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: BLACK,
                ),
              )),
            ],
          )),
    );
  }
}
