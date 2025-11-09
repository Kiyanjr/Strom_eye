import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:strom_eye/provider/weather_provider.dart';

class ForecastSection extends StatelessWidget {
  const ForecastSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();
    final forecast = provider.forecastList;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '5-Day Forecast',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 150,
          child: forecast.isEmpty
              ? const Center(
                  child: Text(
                    'Search a city to see forecast data',
                    style: TextStyle(color: Colors.white70),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: forecast.length,
                  itemBuilder: (context, index) {
                    final item = forecast[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item['day'],
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 8),
                          Image.network(
                            'https://openweathermap.org/img/wn/${item['iconCode']}@2x.png',
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '${item['temp']}°C',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
