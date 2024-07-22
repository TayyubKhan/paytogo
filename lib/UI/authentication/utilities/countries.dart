import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getCountries() async {
  try {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      final countriesJson = jsonDecode(response.body) as List<dynamic>;
      return countriesJson.map((country) => country['name']['common']).toList();
    } else {
      // Handle unsuccessful HTTP status codes
      throw Exception(
          'HTTP request failed with status code ${response.statusCode}');
    }
  } catch (error) {
    // Handle other errors, such as network issues or JSON parsing errors
    print('Error fetching countries: $error');
    rethrow; // Rethrow the error to allow higher-level code to handle it
  }
}
