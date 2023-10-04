import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
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
    new TabItem(Icons.home, "Home", Colors.blue, labelStyle: TextStyle(fontWeight: FontWeight.normal)),
    new TabItem(Icons.search, "Search", Colors.orange, labelStyle: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    new TabItem(Icons.layers, "Reports", Colors.red),
    new TabItem(Icons.notifications, "Notifications", Colors.cyan),
  ]);
  final List<Widget> widgetsChildren = [
    const HomeScreen(),
  ];
  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    CircularBottomNavigationController _navigationController =  CircularBottomNavigationController(indexTap);
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Colors.indigo, primaryColor: Colors.purple),
        child: CircularBottomNavigation(
            tabItems,
            controller: _navigationController,
            ),
      ),
    );
  }
}
