import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weather;
  WeatherModel? get weather => _weather;

  List<Map<String, dynamic>> _forecastList = [];
  List<Map<String, dynamic>> get forecastList => _forecastList;

  final WeatherService _service = WeatherService();

  Future<void> fetchWeather(String city) async {
    final data = await _service.fetchWeather(city);
    if (data != null) {
      _weather = WeatherModel.fromJson(data);
      notifyListeners();
    }
  }

  Future<void> fetchForecast(String city) async {
    try {
      final data = await _service.fetchForecast(city);
      if (data == null || data['list'] == null) {
        _forecastList = [];
        notifyListeners();
        return;
      }

      final List<dynamic> items = data['list'];

      // تلاش برای گرفتن داده‌های ساعت 12 ظهر هر روز
      final noonItems = items.where((item) {
        final txt = (item['dt_txt'] ?? '') as String;
        return txt.contains('12:00:00');
      }).toList();

      List<dynamic> chosenItems;
      if (noonItems.isNotEmpty) {
        chosenItems = noonItems.take(5).toList();
      } else {
        // fallback در صورتی که داده‌ی 12:00 وجود نداشته باشه
        final Map<String, dynamic> byDate = {};
        for (final it in items) {
          final dtTxt = (it['dt_txt'] ?? '') as String;
          if (dtTxt.isEmpty) continue;
          final dateKey = dtTxt.split(' ')[0];
          if (!byDate.containsKey(dateKey)) byDate[dateKey] = it;
        }
        chosenItems = byDate.values.take(5).toList();
      }

      _forecastList = chosenItems.map<Map<String, dynamic>>((it) {
        final date = DateTime.parse(it['dt_txt']);
        final dayName = DateFormat('EEE').format(date);
        final temp = (it['main']['temp'] as num).toStringAsFixed(0);
        final iconCode = it['weather'][0]['icon'];
        return {
          'day': dayName,
          'temp': temp,
          'iconCode': iconCode,
        };
      }).toList();

      notifyListeners();
    } catch (e, st) {
      print('❌ fetchForecast Error: $e\n$st');
      _forecastList = [];
      notifyListeners();
    }
  }
}
