import 'dart:convert';

import 'package:http/http.dart' as http;

const apiKey = 'f65a533b3018aa5baa8c7a8e2aee9c08';
const lat = '38.2466';
const lon = '21.7346';

class Api {
  Future<dynamic> getP() async {
    Map<String, String> headers = {};
    final response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey'),
      headers: headers,
    );
    // print(response.body);
    try {
      final wind = jsonDecode(response.body)['wind']['speed'];
      print(wind);
      return wind;
    } catch (e) {
      throw Error();
    }
  }
}
