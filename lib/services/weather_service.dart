import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = '';

  // دریافت وضعیت فعلی
  Future<Map<String, dynamic>?> fetchWeather(String city) async {
    try {
      final url =
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error: ${response.statusCode}');
        print(response.body);
        return null;
      }
    } catch (e) {
      print('❌ Exception in fetchWeather: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> fetchForecast(String city) async {
    try {
      final url =
          'https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric';

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error fetching forecast: ${response.statusCode}');
        print(response.body);
        return null;
      }
    } catch (e) {
      print('❌ Exception in fetchForecast: $e');
      return null;
    }
  }
}
