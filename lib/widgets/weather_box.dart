import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:strom_eye/models/date.dart';
import 'package:strom_eye/provider/weather_provider.dart';

class WeatherBox extends StatelessWidget {
  const WeatherBox({super.key});

  @override
  Widget build(BuildContext context) {
    final date = DateModel(); //< calls teh class objexts
    final todayDate = date.getFormattedDate(); // store the functions
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.2)),
            ),
            child: Consumer<WeatherProvider>(
              builder: (context, provider, child) {
                final weather = provider.weather;

                if (weather == null) {
                  return const Center(
                    child: Text(
                      'Search for a city to see weather info',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weather.cityName,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      todayDate,
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${weather.temperature.toStringAsFixed(1)}°C',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 70,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      weather.description,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _infoBox('Humidity', '${weather.humidity}%'),
                        _infoBox('Wind', '${weather.windSpeed} m/s'),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _infoBox(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
