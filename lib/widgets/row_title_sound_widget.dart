import 'package:flutter/material.dart';

class RowTitleSound extends StatelessWidget {
  double size;
  Color color;
  String title;
  String data;
  RowTitleSound({
    super.key, required this.title, required this.data, required this.size, required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 50, top: 20),
          child: Text(title,
              style: TextStyle(
                  fontSize: size,
                  fontWeight: FontWeight.bold,
                  color: color)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 150, top: 20),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.volume_up_rounded)),
        )
      ],
    );
  }
}