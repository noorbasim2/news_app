import 'package:flutter/material.dart';
import 'package:newsapp1/pagemodel.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late List<PageModel> pages;

  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0);

  void _addPages() {
    pages = <PageModel>[];
    pages.add(PageModel(
        'images/col.png',
        Icons.ac_unit,
        '1- making friends is easy as waving your hand back forth in easy step',
        'welcom'));
    pages.add(PageModel(
        'images/col1.png',
        Icons.favorite,
        '2- making friends is easy as waving your hand back forth in easy step',
        'favorite'));
    pages.add(PageModel(
        'images/col.png',
        Icons.stars,
        '3- making friends is easy as waving your hand back forth in easy step',
        'stars'));
    pages.add(PageModel(
        'images/col1.png',
        Icons.brightness_low,
        '4- making friends is easy as waving your hand back forth in easy step',
        'brightness'));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(
                            pages[index].image,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.translate(
                          child: Icon(
                            pages[index].icon,
                            size: 150,
                            color: Colors.white,
                          ),
                          offset: Offset(0, -100),
                        ),
                        Text(
                          pages[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 48, right: 48, top: 18),
                          child: Text(
                            pages[index].description,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
              itemCount: pages.length,
              onPageChanged: (index) {
                _pageViewNotifier.value = index;
              },
            ),
            Transform.translate(
              offset: Offset(0, 175),
              child: Align(
                alignment: Alignment.center,
                child: _displayPageIndicators(pages.length),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                      color: Colors.red.shade900,
                      child: Text(
                        'GET STARTED',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          letterSpacing: 1,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              // _updateSeen();
                              return HomeScreen();
                            },
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _displayPageIndicators(int length) {
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.0,
          color: Colors.red,
        ),
      ),
    );
  }

  //   void _updateSeen() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool( 'seen' , true);
  // }

}
