import 'package:flutter/material.dart';
import 'package:newsapp1/shared_ui/navigation_drawer.dart';

import 'home_tabs/favourites.dart';
import 'home_tabs/popular.dart';
import 'home_tabs/whats_new.dart';
// import 'package:news_app/shared_ui/navigation_drawer.dart';

// import 'home_tabs/favourites.dart';
// import 'home_tabs/popular.dart';
// import 'home_tabs/whats_new.dart';

class HeadLineNews extends StatefulWidget {
  const HeadLineNews({Key? key}) : super(key: key);

  @override
  _HeadLineNewsState createState() => _HeadLineNewsState();
}

class _HeadLineNewsState extends State<HeadLineNews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.red.shade800,
          title: Text("Headline News"),
          // centerTitle: false,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {}),
            // _popOutMenu(context),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                text: "WHAT'S NEW",
              ),
              Tab(
                text: "POPULAR",
              ),
              Tab(
                text: "FAVOURITES",
              ),
            ],
            controller: _tabController,
          ),
        ),
        body: Center(
          child: TabBarView(
            children: [
              Favourites(),
              Popular(),
              Favourites(),
            ],
            controller: _tabController,
          ),
        ),
      ),
    );
  }
}
