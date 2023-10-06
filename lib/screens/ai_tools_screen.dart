import 'package:en_learn/widgets/option_menu.dart';
import 'package:en_learn/widgets/widgets.dart';
import 'package:flutter/material.dart';


class AiToolsScreen extends StatelessWidget {
  const AiToolsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarCustomize(title: "Explore")),
      body: Container(

        color: Colors.white,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 200,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                  OptionMenu(title: "Conversaciones interactivas", color: Colors.red),
                  OptionMenu(title: "Recursos Gramaticales", color: Colors.orange),
                  OptionMenu(title: "Evaluar Gramatica", color: Colors.purple)
                ],
              ),
              SizedBox(height: 20,),
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [ 
                  OptionMenu(title: "Traducciones", color: Colors.lightBlue),
                  OptionMenu(title: "Otros", color: Colors.green),
                 
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

