import 'package:en_learn/widgets/option_menu.dart';
import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AiToolsMenuScreen extends StatelessWidget {
  const AiToolsMenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarCustomize(title: "Explore")),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, 'ai_conversation'), 
                    child: const OptionMenu(
                        title: "Conversaciones interactivas", color: Colors.red),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, 'ai_check_grammar'),
                    child: const OptionMenu(title: "Evaluar Gramatica", color: Colors.orange))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, 'ai_translate'),
                      child: const OptionMenu(
                          title: "Traducciones", color: Color.fromARGB(255, 5, 6, 6))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
