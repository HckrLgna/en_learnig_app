import 'package:en_learn/model/Course.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Course>> fetchCourses() async {
  final response = await http.get(Uri.parse('https://rest.cba.com.bo/public/api/mycba/incripciones/6839'));

  if (response.statusCode == 200) {
    final List<dynamic> coursesJson = json.decode(response.body)['data'];
    
    return coursesJson.map((courseJson) {
      return Course(
        name: courseJson['curso_nombre'],
        description: courseJson['periodo_descripcion'],
      );
    }).toList();
  } else {
    throw Exception('Failed to load courses');
  }
}