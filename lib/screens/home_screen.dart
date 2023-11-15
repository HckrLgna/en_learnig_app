import 'package:en_learn/model/Course.dart';
import 'package:en_learn/services/api_cba.dart';
import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color fontColor = Color.fromRGBO(33, 33, 33, 0.8);
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,

      margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
      padding: const EdgeInsets.symmetric(
          horizontal: 20, vertical: 10), // Espaciado interno del contenedor
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 0),
          TitleCustomize(
              data: "Hi! Good Night.",
              fontSize: 30,
              isBold: true,
              color: fontColor),
          const SizedBox(height: 5),
          TitleCustomize(
              data: 'Angel', fontSize: 30, isBold: false, color: fontColor),
          const SizedBox(height: 10),
          TitleCustomize(
              data: "Your courses:",
              fontSize: 20,
              isBold: true,
              color: fontColor),
          Row(
            children: [
              const Icon(Icons.train),
              TitleCustomize(
                  data: "BASIC", fontSize: 15, isBold: false, color: fontColor),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          CardConversationCustom(count: 10, available: true,),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(Icons.train),
              TitleCustomize(
                  data: "INTERMEDIATE",
                  fontSize: 15,
                  isBold: false,
                  color: fontColor),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.3),
              ),
              alignment: Alignment.center,
              width: 150,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage('assets/surpass.jpg'),
                    ),
                    Text("BDA01", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    Text("PERIODO 13", style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            )
        ],
      ),
    ));
  }
}

class CardConversationCustom extends StatelessWidget {
   int count;
   bool available;
  CardConversationCustom({
    super.key, required this.count, required this.available
  });

  @override
  Widget build(BuildContext context) {
    String res = available ? "Available" : "No available";
    return  SizedBox(
  height: 150,
  width: double.infinity,
  child: FutureBuilder<List<Course>>(
    future: fetchCourses(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator(
           
        ); // Muestra un indicador de carga mientras se obtienen los datos.
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return Text('No hay cursos disponibles');
      } else {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final course = snapshot.data![index];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.3),
              ),
              alignment: Alignment.center,
              width: 150,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/topnotch.jpg'),
                  ),
                  Text(course.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(course.description, style: TextStyle(color: Colors.black)),
                ],
              ),
            );
          },
        );
      }
    },
  ),
);
  }
}
