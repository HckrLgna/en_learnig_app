import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> sendIntent(String query) async {
  const String apiUrl = "https://proyecto-sw2.up.railway.app/api/dialogflow/detectIntent";
  final Map<String, String> headers = {"Content-Type": "application/json"};

  final Map<String, String> body = {"languageCode": "en", "queryText": query, "sessionId": "789464"};

  final response = await http.post(Uri.parse(apiUrl), headers: headers, body: jsonEncode(body));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      final decodedData = json.decode(response.body);
      return decodedData["fulfillmentText"];
    } else {
      throw Exception('La respuesta no contiene datos.');
    }
  } else {
    throw Exception('Error al cargar la API. Código de estado: ${response.statusCode}');
  }
}

 
