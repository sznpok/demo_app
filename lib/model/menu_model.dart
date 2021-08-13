/* class SubMenu {
  final String title;
  final String image;
  SubMenu({required this.title, required this.image});

  SubMenu.fromJson(v);
}

var subMenuList = [
  SubMenu(title: 'American Wishkey', image: 'images/w2.jpg'),
  SubMenu(title: 'Chiavas Regal', image: 'images/w3.jpg'),
  SubMenu(title: 'Tuborg Bottle', image: 'images/w4.jpg'),
  SubMenu(title: 'San Miquel', image: 'images/w5.jpg'),
  SubMenu(title: 'Black Wine', image: 'images/w6.jpg'),
  SubMenu(title: 'Sochu', image: 'images/w7.jpg'),
  SubMenu(title: 'Carlsberg', image: 'images/w8.jpg'),
  SubMenu(title: 'Asahi', image: 'images/w9.jpg'),
  SubMenu(title: 'Red Wine', image: 'images/w5.jpg'),
  SubMenu(title: 'Sake', image: 'images/w4.jpg'),
  SubMenu(title: 'Jack Deniels', image: 'images/w6.jpg'),
  SubMenu(title: 'Old Durbar', image: 'images/w3.jpg'),
]; */

/* class Menu {
  final String title;
  Menu({
    required this.title,
  });
}

var menuList = [
  Menu(
    title: 'Whiskey',
  ),
  Menu(
    title: 'Brandy',
  ),
  Menu(
    title: 'Vodka',
  ),
  Menu(
    title: 'Gin',
  ),
  Menu(
    title: 'Wine',
  ),
  Menu(
    title: 'Beer',
  ),
  Menu(
    title: 'Taquila',
  ),
  Menu(
    title: 'Rum',
  ),
  Menu(
    title: 'Japanese Liquor',
  ),
  Menu(
    title: 'Beverages',
  ),
  Menu(
    title: 'Mixers',
  ),
];
 */

class Product {
  String? name;
  List<SubMenu>? subMenu;

  Product({this.name, this.subMenu});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['subMenu'] != null) {
      subMenu = <SubMenu>[];
      json['subMenu'].forEach((v) {
        subMenu!.add(new SubMenu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.subMenu != null) {
      data['subMenu'] = this.subMenu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubMenu {
  String? name;
  String? image;

  SubMenu({this.name, this.image});

  SubMenu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
