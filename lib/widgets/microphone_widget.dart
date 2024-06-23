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
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color.fromRGBO(217, 217, 217, 1)),
      child: Icon(
          widget.turn == false ? Icons.mic_outlined : Icons.mic_outlined,
          size: 70,
          color: const Color.fromRGBO(68, 68, 68, 1)),
    );
  }
}
