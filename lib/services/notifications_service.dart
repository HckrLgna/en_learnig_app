import 'package:flutter/material.dart';

class NotificationsService{
  static GlobalKey<ScaffoldMessengerState> messengerKey = GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String mensaje){
    final snackBar = SnackBar(
      content: Text(
        mensaje,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20
        ),
        )
      );
      messengerKey.currentState!.showSnackBar(snackBar);
  }
}