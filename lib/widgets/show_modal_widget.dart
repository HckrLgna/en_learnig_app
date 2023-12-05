import 'package:flutter/material.dart';

Future<dynamic> showModalBottom(BuildContext context, String mensaje) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Text(mensaje),
          ),
        );
      },
    );
  }