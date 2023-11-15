import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:en_learn/screens/ai_menu_tools_screen.dart';
import 'package:en_learn/screens/ai_tools_screen.dart';

import 'package:en_learn/screens/profile_screen.dart';
import 'package:en_learn/screens/screens.dart';
import 'package:en_learn/widgets/fab_bottom_app_bar.dart';
import 'package:flutter/material.dart';

import 'package:full_screen_menu/full_screen_menu.dart';

class RoutesApp extends StatefulWidget {
  const RoutesApp({super.key});
  @override
  State<RoutesApp> createState() => _RoutesAppState();
}

class _RoutesAppState extends State<RoutesApp> {
  int indexTap = 0;
  final List<Widget> widgetsChildern = [
    const HomeScreen(),
    const ProfileScreen(),
  ];
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: widgetsChildern[indexTap],
      bottomNavigationBar:  BottomNavigationBar(
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
               
          ]
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        disabledElevation: 0.0,
        isExtended: false,
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        onPressed: () => showFullScreenMenu(context),
        
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 19.5,
          backgroundImage: AssetImage('assets/Boot_old.png'),
        )
      ),
    );
  }

  void showFullScreenMenu(BuildContext context) {
    FullScreenMenu.show(
      context,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 0.1),
      items: [
        FSMenuItem(
          icon: const Icon(Icons.translate, color: Colors.white),
          text: const Text('Translate', style: TextStyle(color: Colors.grey)),
          gradient: blueGradient,
          onTap: () {
            setState(() {
              Navigator.pushNamed(context, 'ai_translate');
            });
          },
        ),
        FSMenuItem(
          icon: const Icon(Icons.speaker_notes_outlined, color: Colors.white),
          text: const Text('Conversation', style: TextStyle(color: Colors.grey)),
          gradient: redGradient,
          onTap: () {
            setState(() {
               Navigator.pushNamed(context, 'ai_conversation');
            });
          },
        ),
        FSMenuItem(
          icon: const Icon(Icons.check_circle_outline, color: Colors.white),
          text: const Text('Check Grammar', style: TextStyle(color: Colors.grey)),
          gradient: orangeGradient,
          onTap: () {
            setState(() {
              Navigator.pushNamed(context, 'ai_check_grammar');
            });
          },
        ),  
      ],
    );
  }
}
