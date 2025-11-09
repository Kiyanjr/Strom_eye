import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strom_eye/provider/weather_provider.dart';

class Header extends StatefulWidget {
  const Header({super.key, required this.isDark});
  final bool isDark;
  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final TextEditingController _inputController = TextEditingController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(
      context,
      listen: false,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Colors.white.withOpacity(0.9),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _inputController,
                  style: TextStyle(
                    color: widget.isDark
                        ? Colors.white
                        : Colors.black, // متن کاربر
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Search for city (e.g. New York)',
                    border: InputBorder.none,
                  ),
                  onSubmitted: (value) {
                    _fetchWeather(value, weatherProvider);
                  },
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.search, color: Colors.white),
                  onPressed: () {
                    _fetchWeather(
                      _inputController.text.trim(),
                      weatherProvider,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchWeather(String city, WeatherProvider provider) async {
    if (city.isNotEmpty) {
      try {
        // current
        await provider.fetchWeather(city);

        // 5 days ahaed
        await provider.fetchForecast(city);

        FocusScope.of(context).unfocus();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching weather data: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Please enter a city name")));
    }
  }
}
