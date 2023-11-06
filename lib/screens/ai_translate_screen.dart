import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class AiTranslateScreen extends StatelessWidget {
  const AiTranslateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          color: Colors.white,
        ),
        Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height - 305,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                bottom: 0,
                width: 410,
                child: Container(
                  height: 500,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 0.7),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 50, top: 20),
                            child: const Text("Query:",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(68, 70, 84, 1))),
                          ),
                          
                        ],
                      ),
                      Container(
                        height: 100,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: const SingleChildScrollView(
                          child: Text(
                            "how do you say comida in english?",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(68, 70, 84, 0.4)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: 410,
                child: Container(
                  height: 290,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70),
                        topRight: Radius.circular(70)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 50, top: 20),
                            child: const Text("Response:",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(68, 70, 84, 1))),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 150, top: 20),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.volume_up_rounded)),
                          )
                        ],
                      ),
                      Container(
                        height: 100,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: const SingleChildScrollView(
                          child: Text(
                            "It is a long established fact that a reader will be distracted by the readabledg established fact that a reader will be distracted by the readable content of a page when looking at its layout.).",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Color.fromRGBO(68, 70, 84, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 50),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 102, 129, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.replay_rounded,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    AvatarGlow(
                      animate: true,
                      endRadius: 60,
                      glowColor: const Color.fromRGBO(217, 217, 217, 0.6),
                      duration: const Duration(milliseconds: 2000),
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(68, 70, 84, 0.4),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(
                          Icons.mic_off_sharp,
                          color: Color.fromRGBO(68, 70, 84, 1),
                          size: 35,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 102, 129, 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
