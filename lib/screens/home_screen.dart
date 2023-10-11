import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBarCustomize(title: 'Home')),
        body: Center(
          child: Container(
            width: 350,
            height: 150,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20.0), // Espaciado interno del contenedor
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0), // Bordes redondos
              color: Colors.white, // Color de fondo
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Sombra
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "¡Bienvenido a Cba Talk!",
                  style: TextStyle(
                    color: Color.fromARGB(255, 3, 54, 112), // Azul oscuro
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Próximamente, *Placement test*",
                  style: TextStyle(
                    color: Colors.black54, // Color del subtitulo
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
