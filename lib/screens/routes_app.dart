import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:en_learn/screens/ai_menu_tools_screen.dart';
import 'package:en_learn/screens/ai_tools_screen.dart';
import 'package:en_learn/screens/profile_screen.dart';
import 'package:en_learn/screens/screens.dart';
import 'package:flutter/material.dart';


class RoutesApp extends StatefulWidget {
  const RoutesApp({super.key});

  @override
  State<RoutesApp> createState() => _RoutesAppState();
}

class _RoutesAppState extends State<RoutesApp> {
  int indexTap=0;
  final List<Widget> widgetsChildern = [
      HomeScreen(),
      AiToolsScreen(),
      ProfileScreen()
      
  ];
  void onTapTapped(int index){
    setState(() {
      indexTap=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsChildern[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          
          canvasColor: Colors.white,
          primaryColor: Colors.purple
        ),
        child: BottomNavigationBar(
          currentIndex: indexTap,
          onTap: onTapTapped,
          items:  const [
              BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'AiTools'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.image_search),
                label: 'Profile'
              ),
               
          ]
          ),        
      ),
    );
  }
}