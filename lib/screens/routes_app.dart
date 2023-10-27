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

    const AiToolsScreen(screen: AiTranslateScreen()),
    const AiToolsScreen(screen: AiConversationScreen()),
    const AiToolsScreen(screen: AiCheckGrammarScreen())
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
      bottomNavigationBar: FABBottomAppBar(
          selectedColor: Colors.blue,
          backgroundColor: Colors.white,
          centerItemText: 'AiTools',
          color: Colors.grey,
          notchedShape: const CircularNotchedRectangle(),

          onTabSelected: (value) {
            setState(() {
              indexTap = value;
            });
          },
          items:[
            FABBottomAppBarItem(iconData: Icons.home, text: 'home'),
            FABBottomAppBarItem(iconData: Icons.person_sharp, text: 'profile'),
          ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        disabledElevation: 0.0,
        isExtended: false,

        onPressed: () => showFullScreenMenu(context),
        child: const SizedBox(
          width: 100,
          height: 100,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            backgroundImage: AssetImage('assets/Boot.png'),
          ),
        )
      ),
    );
  }

  void showFullScreenMenu(BuildContext context) {
    FullScreenMenu.show(
      context,
      backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
      items: [
        FSMenuItem(
          icon: const Icon(Icons.ac_unit, color: Colors.black),
          text: const Text('Translate', style: TextStyle(color: Colors.black)),
          gradient: blueGradient,
          onTap: () {
            setState(() {
              indexTap = 2;
            });
          },
        ),
        FSMenuItem(
          icon: const Icon(Icons.wb_sunny, color: Colors.black),
          text: const Text('Conversation', style: TextStyle(color: Colors.black)),
          gradient: redGradient,
          onTap: () {
            setState(() {
              indexTap = 3;
            });
          },
        ),
        FSMenuItem(
          icon: const Icon(Icons.flash_on, color: Colors.black),
          text: const Text('Check Gramar', style: TextStyle(color: Colors.black)),
          gradient: orangeGradient,
          onTap: () {
            setState(() {
              indexTap = 4;
            });
          },
        ),
         
         
      ],
    );
  }
}
