import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showExitDialog(BuildContext context, String title, String mgs, bool isTest) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Text(title),
          content: Text(mgs),
          actions: isTest ?  <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el AlertDialog
              },
            ),
            TextButton(
              child: const Text('Salir'),
              onPressed: () {
                // Navigator.of(context).pop(); // Cierra la aplicación
                Navigator.of(context).popUntil(ModalRoute.withName('home'));
              },
            ),
          ]
            : <Widget>[
                TextButton(
                child: const Text('Terminar'),
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName('home')); // Cierra la aplicación
                },
              ),
            ]
          );
      },
    );
    }
