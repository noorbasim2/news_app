import 'package:flutter/material.dart';
import 'package:newsapp1/models/nav_menu.dart';
import 'package:newsapp1/screens/facebook_feeds.dart';
import 'package:newsapp1/screens/headline_news.dart';
import 'package:newsapp1/screens/home_screen.dart';
import 'package:newsapp1/screens/instagram_feed.dart';
import 'package:newsapp1/screens/twitter_feed.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  List<NavMenuItem> navigationMenu = [
    NavMenuItem("Explore", () => HomeScreen()),
    NavMenuItem("Headline News", () => HeadLineNews()),
    NavMenuItem("Twitter Feeds", () => TwitterFeed()),
    NavMenuItem("Instagram Feeds", () => InstagramFeed()),
    NavMenuItem("Facebook Feeds", () => FacebookFeeds()),
  ];

  // List<String> navMenu = [
  //   'Explore',
  //   'Headline News',
  //   'Twitter Feeds',
  //   'Instagram Feeds',
  //   'Facebook Feeds',
  //   'Login',
  //   'Login',
  //   'Login',
  // ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 75, left: 24),
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  navigationMenu[position].title,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 22,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              navigationMenu[position].destination()));
                },
              ),
            );
          },
          itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
