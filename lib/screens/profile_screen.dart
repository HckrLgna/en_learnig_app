import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarCustomize(title: 'Profile')),
      body: Column(
        children: [
          Container(
            height: 400,
            color: Colors.amber,
          ), 
          SizedBox( height: 20,),
          Container(
            child: Column(
              children: [
                ElevatedButton(onPressed: (){}, child: Text("Notifications")),
                ElevatedButton(onPressed: (){}, child: Text("Notifications")),
                ElevatedButton(onPressed: (){}, child: Text("Notifications"))
              ],
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){}, child: Text("Log out"))
        ],
      ),
       
    );;
  }
}