import 'package:flutter/material.dart';

class MicrophoneWidget extends StatefulWidget {
  const MicrophoneWidget({super.key, required this.turn});
  final bool turn;
  @override
  State<MicrophoneWidget> createState() => _MicrophoneWidgetState();
}

class _MicrophoneWidgetState extends State<MicrophoneWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color.fromRGBO(217, 217, 217, 1)
      ),
      child: Icon(Icons.mic_outlined, size: 70, color: Color.fromRGBO(68, 68, 68, 1)),
    );
  }
}