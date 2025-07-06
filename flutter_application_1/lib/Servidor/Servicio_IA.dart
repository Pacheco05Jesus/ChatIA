import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey = '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'; // Pon tu API Key aquí

 Future<String> sendMessage(String prompt) async {
  final url = Uri.parse('https://api.openai.com/v1/chat/completions');

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": prompt}
        ],
        "temperature": 0.7,
        "max_tokens": 200,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'].toString().trim();
    } else {
      throw Exception('Error: ${response.statusCode} ${response.body}');
    }
  } catch (e) {
    return 'Error al conectar con OpenAI: $e';
  }
}

}
