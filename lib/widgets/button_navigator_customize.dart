import 'package:flutter/material.dart';

class ButtonNavigatorCustomize extends StatefulWidget {

  const ButtonNavigatorCustomize({super.key});

  @override
  State<ButtonNavigatorCustomize> createState() => _ButtonNavigatorCustomizeState();
}

class _ButtonNavigatorCustomizeState extends State<ButtonNavigatorCustomize> {
  int indexTap = 0;  
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: indexTap,
          onTap: onTapTapped,
          items:  const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home',
                backgroundColor: Color.fromRGBO(0, 102, 129, 1)
              ),
               
              BottomNavigationBarItem(
                icon: Icon(Icons.person_sharp),
                label: 'Profile',
                backgroundColor: Color.fromRGBO(0, 102, 129, 1)
              ),
               
          ]);
       
  }
}