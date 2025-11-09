import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:strom_eye/provider/weather_provider.dart';
import 'package:strom_eye/screens/home_screen.dart';
import 'package:strom_eye/utils/theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: const WeatherMasterApp(),
    ),
  );
}

class WeatherMasterApp extends StatefulWidget {
  const WeatherMasterApp({super.key});
  @override
  State<StatefulWidget> createState() {
    return _myApp();
  }
}

class _myApp extends State<WeatherMasterApp> {
  bool dark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Master',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(
        isDark: dark,
        onThemeToggle: () {
          setState(() {
            dark = !dark;
          });
        },
      ),
    );
  }
}
