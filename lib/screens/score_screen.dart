import 'package:en_learn/providers/backend.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'dart:math';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final backendService = Provider.of<BackendProvider>(context, listen: false);
    var progress = Random().nextInt(9) + 1;
    var fluency = Random().nextInt(5) + 1;
    var pronunciation = Random().nextInt(5) + 1;
    var rhythm = Random().nextInt(5) + 1;
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarCustomize(title: 'Profile')),
      body: Center(
        child: ListView(children: <Widget>[
          SizedBox(
            height: 300,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 110),
                  padding: const EdgeInsets.only(top:60 ,bottom: 10),
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
                Positioned(
                  top: 10,
                  child: CircularPercentIndicator(
                    radius: 70.0,
                    lineWidth: 10.0,
                    percent: 0.8,
                    header: const Text("Progress"),
                    center: const CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/user.png'),
                    ),
                    backgroundColor: Colors.grey,
                    progressColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox( height: 30, ),
          const Center(
                  child: Text(
                    "Practice Progress",
                    style: TextStyle(
                      fontSize: 20, // Tamaño de fuente
                      fontWeight: FontWeight.bold, // Negrita
                      color: Color.fromRGBO(0, 102, 129, 1), // Color del texto
                      // Puedes agregar más propiedades según tus preferencias
                    ),
                  ),
                ),
          CircularPercentIndicator(
            
            radius: 80.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 15.0,
            percent: 0.4,
            center: const Text(
              "40 hours",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.yellow,
            progressColor: Colors.red,
            footer: const Text(
              "Hours of practice",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17.0),
            )
          ),
          const SizedBox( height: 25, ),
          CircularPercentIndicator(
            
            radius: 80.0,
            lineWidth: 13.0,
            animation: true,
            percent: 0.7 + (progress/100),
            center:  Text(
              "7$progress.0%",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: const Text(
              "Percent progress in the course",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.purple,
            
          ),
          const SizedBox( height: 25, ),
          const Center(
                  child: Text(
                    "Speaking Skills",
                    style: TextStyle(
                      fontSize: 20, // Tamaño de fuente
                      fontWeight: FontWeight.bold, // Negrita
                      color: Color.fromRGBO(0, 102, 129, 1), // Color del texto
                      // Puedes agregar más propiedades según tus preferencias
                    ),
                  ),
                ),
          Container(
            padding: const EdgeInsets.all(15.0),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.10 + (fluency/100),
                  center: Text("1$fluency%"),
                  progressColor: Colors.red,
                  footer: const Text("Fluency"),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.30 + (pronunciation/100),
                  center: Text("3$pronunciation%"),
                  progressColor: Colors.orange,
                  footer: const Text("Pronunciation "),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.60 + (rhythm/100),
                  center: Text("6$rhythm%"),
                  progressColor: Colors.yellow,
                  footer: const Text("Rhythm"),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
