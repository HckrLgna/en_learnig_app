import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:en_learn/screens/ai_tools_screen.dart';
import 'package:en_learn/screens/screens.dart';
import 'package:flutter/material.dart';


class RoutesApp extends StatefulWidget {
  const RoutesApp({super.key});

  @override
  State<RoutesApp> createState() => _RoutesAppState();
}

class _RoutesAppState extends State<RoutesApp> {
  int indexTap = 0;
  final List<TabItem> tabItems = List.of([
    TabItem(Icons.home, "Home", Colors.grey,
        labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    TabItem(Icons.search, "Questioner", Colors.grey,
        labelStyle:
            const TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TabItem(Icons.account_circle, "Account", Colors.grey),
  ]);
  final List<Widget> widgetsChildren = [
    const HomeScreen(),
    const AiToolsScreen()
  ];
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
      print(indexTap);
    });
  }

  @override
  Widget build(BuildContext context) {
    CircularBottomNavigationController _navigationController =
        CircularBottomNavigationController(indexTap);
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.indigo, primaryColor: Colors.purple),
        child: CircularBottomNavigation(
          tabItems,
          controller: _navigationController,
          selectedCallback: (selectedPos) {
            onTapTapped(selectedPos!);
             
          },
        ),
      ),
    );
  }
}
