import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2/conversation.pb.dart';
import 'package:en_learn/model/Conversations.dart';
import 'package:en_learn/model/Course.dart';
import 'package:en_learn/services/api_cba.dart';
import 'package:en_learn/widgets/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  var titles = ["Occupation", "presentation"];
  var assets = ["assets/occupation.jpg", "assets/presentation.png"];  
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
              data: 'Jaime', fontSize: 30, isBold: false, color: fontColor),
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
          CardConversationCustom(titles: titles, assets: assets),
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
                color: Colors.grey
                    .withOpacity(0.3) // Color de fondo del contenedor
                ),
            alignment: Alignment.center,
            width: 150,
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("No available",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class CardConversationCustom extends StatelessWidget {
  final List<String> titles;
  final List<String> assets;
  const CardConversationCustom({
    super.key,
    required this.titles,
    required this.assets,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, int index) {
          return InkWell(
            onTap: () {
              // Navigator.pushNamed(context, 'ai_conversation',
              //     arguments: AiConversationArguments(
              //         title: "Conversation about Occupations",
              //         entity: "occupations",
              //         path: "assets/occupations.json"));
              Navigator.pushNamed(context, 'ai_conversation', arguments: 0);
              debugPrint("Tapped on container $index");
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircularPercentIndicator(
                    radius: 45.0,
                    lineWidth: 10.0,
                    percent: 0.1,
                    center: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(assets[index]),
                    ),
                    progressColor: Colors.blue,
                  ),
                  Text(titles[index],
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const Text(
                    "Available",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
