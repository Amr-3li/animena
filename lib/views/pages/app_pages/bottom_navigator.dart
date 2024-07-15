import 'package:animena/views/pages/app_pages/Profile_page.dart';
import 'package:animena/views/pages/app_pages/category_page.dart';
import 'package:animena/views/pages/app_pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {

  int myIndex = 0;
  List<Widget> Screens = [
    HomePage(),
    CategoryPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: CupertinoIconThemeData(size: 32),
          backgroundColor: Color.fromARGB(255, 22, 89, 22),
          unselectedItemColor: Color.fromARGB(255, 166, 166, 166),
          mouseCursor: MouseCursor.uncontrolled,
          selectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "My profile",
            )
          ]),
      body: Screens[myIndex],
    );
  }
}
