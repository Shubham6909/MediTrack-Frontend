import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://e-platapi.aecci.org.in';

  Future<Map<String, dynamic>> createClient(Map<String, dynamic> payload) async {
    try {
      print('Sending payload: ${json.encode(payload)}');

      final response = await http.post(
        Uri.parse('$baseUrl/createClient'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json', // Add this to explicitly request JSON response
        },
        body: json.encode(payload),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      // Handle different response scenarios
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // Successful response
        return json.decode(response.body);
      } else {
        // Parse error message from response if possible
        final errorBody = json.decode(response.body);
        throw Exception(
            'Failed to create client: ${response.statusCode}\n'
                'Error: ${errorBody['message'] ?? response.body}'
        );
      }
    } catch (e) {
      print('API Error: $e');
      throw Exception('Error creating client: $e');
    }
  }
}