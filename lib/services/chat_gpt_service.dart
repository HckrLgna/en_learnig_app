import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> sendRequest(String query) async {
  const String apiUrl = "https://backendcbatalk-production.up.railway.app/api/consulta";
  final Map<String, String> headers = {"Content-Type": "application/json"};

  final Map<String, String> body = {"consulta": query};

  final response = await http.post(Uri.parse(apiUrl), headers: headers, body: jsonEncode(body));

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      final decodedData = json.decode(response.body);
      return decodedData;
    } else {
      throw Exception('La respuesta no contiene datos.');
    }
  } else {
    throw Exception('Error al cargar la API. Código de estado: ${response.statusCode}');
  }
}

 
