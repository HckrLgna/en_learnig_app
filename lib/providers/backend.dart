import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BackendProvider extends ChangeNotifier {
  String baseUrl = 'backendcbatalk-production.up.railway.app';

  var modulo = 3;
  var resModulo = "";
  var preguntaActual = "";

  void pruebaIniciar() async {
    var url = Uri.https(baseUrl, 'api/prueba/iniciar/$modulo');
    try {
      final response = await http.get(url);

      var decodeResponse = json.decode(response.body);
      preguntaActual = decodeResponse['preguntaActual'];
      // asistencias = decodedData.map((json) => Asistencia.fromJson(json)).toList();
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
    //print(preguntaActual);
  }

  Future<String> pruebaSiguiente(String res) async {
    var url = Uri.https(baseUrl, 'api/prueba/siguiente');
    final Map<String, dynamic> resData = {
      'respuesta': res,
    };
    final response = await http.post(url,
          body: json.encode(resData),
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
    var decodeResponse = json.decode(response.body);;
    try {
      print(response.body);

     
      print(decodeResponse['preguntaActual']);

      print(decodeResponse.containsKey('msg')  );
      if (decodeResponse.containsKey('msg')) {
          resModulo = decodeResponse['resultado'];
          preguntaActual = decodeResponse['msg'];
          notifyListeners();
          print(" print del primer retorno $preguntaActual");
        return preguntaActual;
      } else {
          print(decodeResponse);
          preguntaActual = decodeResponse['preguntaActual'];
          print(" print del segundo retorno $preguntaActual");
          notifyListeners();
        return preguntaActual;
      }

      // asistencias = decodedData.map((json) => Asistencia.fromJson(json)).toList();
    } catch (e) {
      debugPrint(e.toString());
      print("error");
      resModulo = decodeResponse['resultado'];
      preguntaActual = decodeResponse['msg'];
       return preguntaActual;
    }
    
  }

  
  
}
