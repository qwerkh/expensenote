import 'dart:async';
import 'package:flutter/material.dart';
import '../models/category_model.dart';
import '../resources/category_repository.dart';

enum TabsDemoStyle { iconsAndText, iconsOnly, textOnly }

class Dashboard extends StatefulWidget {

  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {


  List<CategoryModel> _category;
  CategoryRepository repository;

  /*final List<CategoryModel> _category = <CategoryModel>[
    CategoryModel("001", "Fruit","001"),
    CategoryModel("002", "Juice","002"),
    CategoryModel("003", "Beer","003"),
    CategoryModel("004", "Vegetable","004"),
    CategoryModel("005", "Meat","005"),
    CategoryModel("006", "Food","006"),
    CategoryModel("007", "Frape","007"),
  ];*/

  TabController _controller;
  TabsDemoStyle _demoStyle = TabsDemoStyle.textOnly;
  bool _customIndicator = true;

  @override
  void initState() {
    super.initState();
    //_category=repository.fetchCategory();
    _controller = TabController(length: 10, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Decoration getIndicator() {
    if (!_customIndicator) return const UnderlineTabIndicator();

    switch (_demoStyle) {
      case TabsDemoStyle.iconsAndText:
        return ShapeDecoration(
          shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                side: BorderSide(
                  color: Colors.white24,
                  width: 2.0,
                ),
              ) +
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                side: BorderSide(
                  color: Colors.transparent,
                  width: 4.0,
                ),
              ),
        );

      case TabsDemoStyle.iconsOnly:
        return ShapeDecoration(
          shape: const CircleBorder(
                side: BorderSide(
                  color: Colors.white24,
                  width: 4.0,
                ),
              ) +
              const CircleBorder(
                side: BorderSide(
                  color: Colors.transparent,
                  width: 4.0,
                ),
              ),
        );

      case TabsDemoStyle.textOnly:
        return ShapeDecoration(
          shape: const StadiumBorder(
                side: BorderSide(
                  color: Colors.white24,
                  width: 2.0,
                ),
              ) +
              const StadiumBorder(
                side: BorderSide(
                  color: Colors.transparent,
                  width: 4.0,
                ),
              ),
        );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var tabBarView = TabBarView(
            controller: _controller,
            children: _category.map<Widget>((CategoryModel category) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Container(
                  key: ObjectKey(category.id),
                  padding: const EdgeInsets.all(12.0),
                  child: Card(
                    child: Center(
                      child: Text(category.id),
                    ),
                  ),
                ),
              );
            }).toList(),
          );

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                backgroundColor: Colors.teal,
                pinned: true,
                /*title: Text("POS System",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      )),*/
                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Center(
                      child: Text("POS System",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          )),
                    ),
                    background: Image.network(
                      "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                      fit: BoxFit.cover,
                    )),
                bottom: TabBar(
                  controller: _controller,
                  isScrollable: true,
                  labelColor: Colors.lightBlue[50],
                  indicator: getIndicator(),
                  unselectedLabelColor: Colors.lightBlue[0],
                  indicatorColor: Colors.lightBlue[50],
                  labelStyle:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  tabs: _category.map<Tab>((CategoryModel category) {
                    return Tab(text: category.name);
                  }).toList(),
                ),
              ),
              /*SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    TabBar(
                      controller: _controller,
                      isScrollable: true,
                      labelColor: Colors.black87,
                      indicator: UnderlineTabIndicator(),
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Colors.lightBlue,
                      labelStyle: TextStyle(fontSize: 20,),
                      tabs: _category.map<Tab>((CategoryModel category) {
                        return Tab(text: category.name);
                      }).toList(),
                    ),
                  ),
                  pinned: true,
                ),*/
            ];
          },
          body: tabBarView,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        elevation: 2,
        foregroundColor: Colors.white,
        backgroundColor: Colors.teal,
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
