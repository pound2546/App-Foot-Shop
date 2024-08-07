import 'package:flutter/material.dart';
import 'package:flutter_application_pj2/components/my_discription_box.dart';
import 'package:flutter_application_pj2/components/my_current_location.dart';
import 'package:flutter_application_pj2/components/my_drawer.dart';
import 'package:flutter_application_pj2/components/my_shoes_tile.dart';
import 'package:flutter_application_pj2/components/my_silver_app_bar.dart';
import 'package:flutter_application_pj2/components/my_tab_bar.dart';
import 'package:flutter_application_pj2/models/shoes.dart';
import 'package:flutter_application_pj2/models/shop.dart';
import 'package:flutter_application_pj2/pages/shoes_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: ShoesCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  //sort out and return a list of shoes item
  List<Shoes> _filterMenuByCategory(
      ShoesCategory category, List<Shoes> fullMenu) {
    return fullMenu.where((shoes) => shoes.category == category).toList();
  }

  // return list of shoes

  List<Widget> getShoesInThisCategory(List<Shoes> fullMenu) {
    return ShoesCategory.values.map((category) {
      //get category menu
      List<Shoes> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual shoes
          final shoes = categoryMenu[index];

          //return shoes tile UI
          return ShoesTile(
            shoes: shoes,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ShoesPage(shoes: shoes),
              ),
            ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Colors.black,
                ),

                // my current location
                MyCurrentLocation(),

                //description box
                MyDescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Shop>(
          builder: (context, shop, child) => TabBarView(
            controller: _tabController,
            children: getShoesInThisCategory(shop.menu),
          ),
        ),
      ),
    );
  }
}
