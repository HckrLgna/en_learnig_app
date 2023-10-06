import 'package:flutter/material.dart';

class OptionMenu extends StatelessWidget {
  const OptionMenu({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Se presiono ');
      },
      child: Column(
        children:<Widget> [
          Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.access_time,color: Colors.amber),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color
                ),
              ),
            ],
            ),
          const SizedBox(height: 8,),
          SizedBox(
            width: 100,
            child: Text(title,textAlign: TextAlign.center,)
            )
        ],
      ),
    );
  }
}