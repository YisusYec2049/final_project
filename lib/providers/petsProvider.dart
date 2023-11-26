import 'dart:convert';
import 'package:final_project/model/pets.dart';
import 'package:http/http.dart' as http;

class PetsProvider {
  final url = Uri.parse('http://jeyliss05.pythonanywhere.com/api/animales');

  Future<List<Pets>> fetchPets() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      List<Pets> pets = [];
      for (var item in jsonData) {
        pets.add(Pets(
          description: item['descripcion'],
          age: item['edad'],
          id: item['id'],
          image_url: item['imagen_url'],
          location: item['ubicacion'],
          name: item['nombre'],
          state: item['estado'],
        ));
      }
      return pets;
    } else {
      throw Exception('Error en el provider');
    }
  }

  Future<List<Pets>> fetchLocation(String location) async {
    print('Fetching pets for location: $location');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      print('All Pets: $jsonData');

      List<Pets> filteredPets =
          jsonData.map((pets) => Pets.fromJson(pets)).where((pets) {
        final petLocation = pets.location.toLowerCase();
        final selectedLocation = location.toLowerCase();
        print(
            'Pet Location: $petLocation, Selected Location: $selectedLocation');
        return location == 'Todos' || petLocation == selectedLocation;
      }).toList();

      print('Filtered Pets: $filteredPets, Length: ${filteredPets.length}');
      return filteredPets;
    } else {
      throw Exception('Error en location');
    }
  }
}
