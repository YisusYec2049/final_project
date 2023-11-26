import 'dart:convert';

import 'package:final_project/model/pets.dart';
import 'package:http/http.dart' as http;

class InformationProvider {
  final baseUrl = 'http://jeyliss05.pythonanywhere.com/api/animales';

  Future<List<Pets>> fetchInformartion() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List<Pets> information = [];

      for (var item in jsonData) {
        information.add(
          Pets(
            description: item['descripcion'],
            age: item['edad'],
            id: item['id'],
            image_url: item['imagen_url'],
            location: item['ubicacion'],
            name: item['nombre'],
            state: item['estado'],
          ),
        );
      }
      return information;
    } else {
      throw Exception('Error en el provider');
    }
  }
}
