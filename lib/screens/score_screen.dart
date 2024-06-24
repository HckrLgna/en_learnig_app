import 'package:en_learn/providers/backend.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/services.dart';
import '../widgets/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final backendService = Provider.of<BackendProvider>(context, listen: false);
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
                    header: Text("Progress"),
                    center: CircleAvatar(
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
          CircularPercentIndicator(
            header: const Text("Practiced hours"),
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
          ),
          const SizedBox( height: 25, ),
          CircularPercentIndicator(
            header: const Text("Percent progress in the course", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
            radius: 80.0,
            lineWidth: 13.0,
            animation: true,
            percent: 0.7,
            center:  const Text(
              "70.0%",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            footer: const Text(
              "Progress this week",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.purple,
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: new CircularPercentIndicator(
              radius: 60.0,
              lineWidth: 5.0,
              percent: 1.0,
              center: new Text("100%"),
              progressColor: Colors.green,
            ),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.10,
                  center: new Text("10%"),
                  progressColor: Colors.red,
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                new CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.30,
                  center: new Text("30%"),
                  progressColor: Colors.orange,
                ),
                new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                ),
                new CircularPercentIndicator(
                  radius: 45.0,
                  lineWidth: 4.0,
                  percent: 0.60,
                  center: new Text("60%"),
                  progressColor: Colors.yellow,
                ),
                new Padding(
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
