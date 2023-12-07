
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class BackendProvider extends ChangeNotifier {

  String baseUrl = 'proyecto-sw2.up.railway.app';  
  
  var modulo = 3;
  var preguntaActual = "";

  void pruebaIniciar() async {
    var url = Uri.https( baseUrl, 'api/prueba/iniciar/$modulo');
    print(url);
    try {
      final response = await http.get( url );
      print("RESULTADO DE LA PETICION");
      print( json.decode( response.body ) );
      // List<dynamic> decodedData = json.decode( response.body );
      // asistencias = decodedData.map((json) => Asistencia.fromJson(json)).toList();           
      notifyListeners();      
    } catch (e) {
      debugPrint( e.toString() );
    }    
  }
  void getVehiculosCliente() async {
    // var url = Uri.http( baseUrl, 'api/vehiculo/${usuario.id}/vehiculosGet');    
    try {
      // final response = await http.get( url );
      // List<dynamic> jsonData = json.decode( response.body );
      // vehiculos = jsonData.map((json) => Vehiculo.fromJson(json)).toList();                     
      notifyListeners();      
    } catch (e) {
      debugPrint( e.toString() );
    }    
  }

  // Future<Usuario> login( String carnet, String contrasena ) async {
  //   final url = Uri.http( baseUrl, 'api/auth/login');
  //   final Map<String, dynamic> loginData = {
  //     'carnet': carnet,
  //     'contrasena': contrasena
  //   };    
  //   try {
  //     final response = await http.post( url, body: json.encode( loginData ), headers: {'Content-Type': 'application/json; charset=UTF-8'} );      
  //     final Map<String, dynamic> decodedData = json.decode( response.body );
  //     Usuario usuario = Usuario.fromJson( decodedData );      
  //     //notifyListeners();
  //     return usuario;   
  //   } catch (e) {
  //     debugPrint( e.toString() );
  //   }
  //   return Usuario(id: 0, nombre: 'nombre', estado: 'estado');
  // }
}
