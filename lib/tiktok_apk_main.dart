import 'package:flutter/material.dart';
import 'tiktok_home.dart';
import 'red.dart';
import 'yellow.dart';
import 'orange.dart';
import 'green.dart';

class TiktokApk extends StatefulWidget {
  const TiktokApk({Key? key}) : super(key: key);

  @override
  _TiktokApkState createState() => _TiktokApkState();
}

class _TiktokApkState extends State<TiktokApk> {
  int _selectedIndex = 0;
  // static const List<Widget> _options = <Widget>[
  //   Text('Home Screen',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Discover Screen',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Settings Screen',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Inbox Screen',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  //   Text('Profile Screen',
  //       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  // ];
  // void _onItemTap(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  void pageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        TiktokHome(),
        Yellow(),
        Green(),
        Red(),
        Orange(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tiktok",
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: Colors.black,
      ),

      //
      body: buildPageView(),

      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.black),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Discover',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined),
              label: 'Settings',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_sharp),
                label: 'Inbox',
                backgroundColor: Colors.white),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                label: 'Me',
                backgroundColor: Colors.white),
          ],
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white,
          iconSize: 35,
          onTap: (index) {
            bottomTapped(index);
          },
          elevation: 5),
    );
  }
}
