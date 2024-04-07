import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

class OpenAiFeatures{
  final String openAIAPIKey = 'pk-ptUkpEKGBeaWcAzAxWrbJonKckVEdoeNcHHuntrrRFlTiasO';

  Future<String> chatGPTAPI(List messages) async {

    try {
      final res = await http.post(
        // Uri.parse('https://api.openai.com/v1/chat/completions'),
        Uri.parse('https://api.pawan.krd/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIAPIKey',
        },
        body: jsonEncode({
          // "model": "gpt-3.5-turbo",
          "model": "pai-001-light",
          "messages": messages,
        }),
      );

      if (res.statusCode == 200) {
        String content =
        jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();
        print(content);
        return content;
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

}