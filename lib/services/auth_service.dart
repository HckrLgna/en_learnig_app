import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService extends ChangeNotifier{
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyCCeOATzhxAiLbFgV3OeZsIMU6c-FIcpNU';
  final storage = const FlutterSecureStorage();

  Future<String?> login(String email, String password)async{
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };
    final url = Uri.https(_baseUrl, '/v1/accounts:signInWithPassword',{
      'key': _firebaseToken,
    });
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String,dynamic> decodeResp = json.decode(resp.body);
      print('respuesta del login: $decodeResp');
    if (decodeResp.containsKey('idToken')){
        await storage.write(key: 'token', value: decodeResp['idToken']);
      return null;
    }else{
      return decodeResp['error']['mensaje'];
    }
  }

  Future logout()async{
    await storage.delete(key: 'token');
    return null;
  }

  Future readToken()async{
    return await storage.read(key: 'token')?? '';
  }
}