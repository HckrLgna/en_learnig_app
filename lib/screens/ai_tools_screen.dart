 
import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_menu/full_screen_menu.dart';

import 'profile_screen.dart';
import 'screens.dart';


class AiToolsScreen extends StatefulWidget {
  final Widget screen;
  final String title;
  const AiToolsScreen({super.key, required this.screen, required this.title});

  @override
  State<AiToolsScreen> createState() => _AiToolsScreenState();
}

class _AiToolsScreenState extends State<AiToolsScreen> {
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
      appBar:  PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarCustomize(title: widget.title)),
      body: widget.screen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexTap,
          onTap: onTapTapped,
          items:  const [
              BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home'
              ),
               
              BottomNavigationBarItem(
                icon: Icon(Icons.person_sharp),
                label: 'Profile'
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

