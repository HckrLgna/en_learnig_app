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
              data: "Hi! Good Morning.",
              fontSize: 30,
              isBold: true,
              color: fontColor),
          const SizedBox(height: 5),
          TitleCustomize(
              data: 'Angel', fontSize: 30, isBold: false, color: fontColor),
          const SizedBox(height: 10),
          TitleCustomize(
              data: "Conversation availables:",
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
          CardConversationCustom(),
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
          CardConversationCustom(),
        ],
      ),
    ));
  }
}

class CardConversationCustom extends StatelessWidget {
  const CardConversationCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'ai_conversation');
            
              debugPrint("Tapped on container $index" );
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey
                      .withOpacity(0.3) // Color de fondo del contenedor
                  ),
              alignment: Alignment.center,
              width: 150,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                  Text("Greatings", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text("Available", style: TextStyle(color: Colors.green),)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
