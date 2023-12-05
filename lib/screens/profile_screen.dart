import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context,listen: false);
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarCustomize(title: 'Profile')),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 70),
                    padding: const EdgeInsets.only(top: 60),
                    width: 300,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(217, 217, 217, 1),
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40)),
                    child: Column(
                      children: [
                        Title(
                          color: const Color.fromRGBO(0, 102, 129, 1),
                          child: const Text(
                            "Angel Charca",
                            style: TextStyle(
                              fontSize: 24, // Tamaño de fuente
                              fontWeight: FontWeight.bold, // Negrita
                              color: Color.fromRGBO(
                                  0, 102, 129, 1), // Color del texto
                              // Puedes agregar más propiedades según tus preferencias
                            ),
                          ),
                        ),
                        const Text(
                          "Level: Basic",
                          style: TextStyle(
                            fontSize: 16, // Tamaño de fuente
                            color: Colors.black, // Color del texto
                            // Otras propiedades de estilo
                          ),
                        ),
                        const Text(
                          "Curse: BDA12",
                          style: TextStyle(
                            fontSize: 16, // Tamaño de fuente
                            color: Colors.black, // Color del texto
                            // Otras propiedades de estilo
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 20,
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/user.png'),
                      radius: 50,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 40),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      // Acción que quieres realizar al presionar el botón
                      Navigator.pushNamed(context, 'placement_test');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // Fondo blanco
                        borderRadius:
                            BorderRadius.circular(10), // Bordes redondeados
                        border: Border.all(color: Colors.grey), // Borde gris
                      ),
                      padding:
                          const EdgeInsets.all(10), // Ajusta el espaciado interno
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Espacia los elementos al inicio y al final
                        children: [
                           Row(
                            children: [
                              Icon(Icons.type_specimen), // Primer icono
                              SizedBox(
                                width: 10,
                              ),
                              Text('Placement Test'), // Texto
                            ],
                          ),
                          Icon(Icons.arrow_forward_ios), // Último icono
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                  authService.logout();
                  Navigator.pushReplacementNamed(context, 'login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(0, 102, 129, 1),
                minimumSize: const Size(280,
                    50), // Hace que el botón ocupe todo el ancho y tenga una altura de 50
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      10), // Ajusta el radio de los bordes
                ),
              ),
              child: const Text(
                'Logout',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white), // Cambia el estilo del texto
              ),
            )
          ],
        ),
      ),
    );
  }
}
