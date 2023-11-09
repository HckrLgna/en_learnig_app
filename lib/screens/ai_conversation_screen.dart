import 'dart:async';

import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:dialogflow_grpc/generated/google/cloud/dialogflow/v2beta1/session.pb.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter/services.dart';

class AiConversationScreen extends StatefulWidget {
  const AiConversationScreen({super.key});

  @override
  State<AiConversationScreen> createState() => _AiConversationScreenState();
}

class _AiConversationScreenState extends State<AiConversationScreen> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = TextEditingController();
  bool _isRecording = false;

  late SpeechToText speechToText;
  late StreamSubscription _recorderStatus;
  late StreamSubscription<List<int>> _audioStreamSubscription;
  late DialogflowGrpcV2Beta1 dialogflow;

  late FlutterTts flutterTts;
  @override
  void initState() {
    super.initState();
    initPlugin();
  }

  Future<void> initPlugin() async {
    // initializing speech t otext plugin
    speechToText = SpeechToText();

    flutterTts = FlutterTts();
    _messages.add(const ChatMessage(
        text: "Hello, I'm CbaTalk.", name: "CbaTalk", type: false));
    final serviceAccount = ServiceAccount.fromString(
      await rootBundle.loadString(
        'assets/credentials.json',
      ),
    );
    var res = await speechToText.initialize(
      options: [SpeechToText.androidIntentLookup],
    );
    print(res);
    // dialogflow setup
    dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
    setState(() {});

    speak("Hello, I'm C b a Talk.");
  }

  void stopStream() async {
    await _audioStreamSubscription.cancel();
  }

  void handleSubmitted(text) async {
    _textController.clear();

    ChatMessage message = ChatMessage(
      text: text,
      name: "You",
      type: true,
    );

    setState(() {
      _messages.insert(0, message);
    });

    // callling dialogflow api
    DetectIntentResponse data = await dialogflow.detectIntent(text, 'en-US');

    // getting meaningful response text
    String fulfillmentText = data.queryResult.fulfillmentText;
    print(fulfillmentText);
    if (fulfillmentText.isNotEmpty) {
      ChatMessage botMessage = ChatMessage(
        text: fulfillmentText,
        name: "CbaTalk",
        type: false,
      );
      speak(fulfillmentText);

      setState(() {
        _messages.insert(0, botMessage);
      });
    }
  }

  void _onSpeechResult(SpeechRecognitionResult result) async {
    String lastWords = result.recognizedWords;
    // setting textediting controller to the speech value and moving cursor at the end
    _textController.text = lastWords;
    _textController.selection = TextSelection.collapsed(
      offset: _textController.text.length,
    );

    setState(() {
      _isRecording = false;
    });
    await Future.delayed(const Duration(seconds: 5));
    _stopListening();
  }

  void handleStream() async {
    setState(() {
      _isRecording = true;
    });
    await speechToText.listen(
      onResult: _onSpeechResult,
    );
  }

  void speak(String message) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(message);
  }

  void _stopListening() async {
    await speechToText.stop();
  }

  @override
  void dispose() {
    //_recorderStatus.cancel();
    //_audioStreamSubscription.cancel();
    speechToText.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Positioned(
            bottom: 0,
            width: 410,
            child: Container(
              height: 670,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 131, 131, 131),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70)),
              ),
              child:  Stack(
                children: [
                  Positioned(top: 0, left:0, right:0, child: ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(70), topRight: Radius.circular(70)), child: Image.network("https://avantideas.com/wp-content/uploads/2023/06/mejores-practicas-para-conversaciones-de-coaching.jpg", fit: BoxFit.fill,))),
                ],
               ),
            )
        ),
        Positioned(
          bottom: 0,
          width: 410,
          child: Container(
            height: 500,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(70), topRight: Radius.circular(70)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 0, right: 0, bottom: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      height: 290,
                      decoration: const BoxDecoration(
                         
                        color: Color.fromRGBO(217, 217, 217, 0.3),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(70),
                            topRight: Radius.circular(70),
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      child: ListView.builder(
                          padding: const EdgeInsets.all(10.0),
                          reverse: true,
                          itemBuilder: (_, index) => GestureDetector(
                                onTap: () {
                                  print("se selecciono $index");
                                },
                                child: _messages[index],
                              ),
                          itemCount: _messages.length),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.all(8),
                    //width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      border: Border.all(
                          color: const Color.fromRGBO(217, 217, 217, 1)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    //margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextField(
                              enabled: true,
                              controller: _textController,
                              onSubmitted: handleSubmitted,
                              decoration: const InputDecoration.collapsed(
                                  hintText: "Listening"),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: IconButton(
                            icon: const Icon(Icons.send),
                            onPressed: () =>
                                handleSubmitted(_textController.text),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromRGBO(217, 217, 217, 1)),
                          child: IconButton(
                              iconSize: 30.0,
                              icon: Icon(_isRecording
                                  ? Icons.mic_outlined
                                  : Icons.mic_off_outlined),
                              onPressed: () {
                                handleStream();
                              }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
