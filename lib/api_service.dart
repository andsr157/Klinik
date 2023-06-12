import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ServisAPI {
  static const String _baseUrl = "https://jsonplaceholder.typicode.com";

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('$_baseUrl/photos'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Gagal Load");
    }
  }
}
