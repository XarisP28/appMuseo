import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://10.4.22.149/museum';

  static Future<List<dynamic>> getCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/get-characters'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al cargar personajes');
    }
  }
}
