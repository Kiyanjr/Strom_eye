import 'package:flutter/material.dart';

class FutureCards extends StatelessWidget {
  final String day;
  final IconData icon;
  final String temperature;

  const FutureCards({
    super.key,
    required this.day,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white.withOpacity(0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          width: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Icon(icon, color: Colors.white, size: 30),
              const SizedBox(height: 10),
              Text(
                temperature,
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
