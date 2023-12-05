import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: const Text('Abandonar el test'),
          content: const Text('¿Estás seguro de que quieres salir?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el AlertDialog
              },
            ),
            TextButton(
              child: const Text('Salir'),
              onPressed: () {
                Navigator.of(context).pushNamed('home'); // Cierra la aplicación
              },
            ),
          ],
        );
      },
    );
    }
