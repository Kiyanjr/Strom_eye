import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:strom_eye/provider/weather_provider.dart';
import 'package:strom_eye/widgets/FutureBox.dart';
import 'package:strom_eye/widgets/header.dart';
import 'package:strom_eye/widgets/weather_box.dart';

class HomeScreen extends StatefulWidget {
  final bool isDark; // از main میاد
  final VoidCallback onThemeToggle; // از main میاد

  const HomeScreen({
    super.key,
    required this.isDark,
    required this.onThemeToggle,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,

        appBar: AppBar(
          title: Text(
            'Storm Eye',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: InkWell(
                onTap: widget.onThemeToggle,
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.black26,
                    shape: BoxShape.circle,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) {
                      return RotationTransition(
                        turns: animation,
                        child: FadeTransition(opacity: animation, child: child),
                      );
                    },
                    child: Image.asset(
                      widget.isDark
                          ? 'assets/icons/night.png'
                          : 'assets/icons/sun.png',
                      key: ValueKey<bool>(widget.isDark),
                      width: 26,
                      height: 26,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        body: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: widget.isDark
                  ? const [
                      Color(0xFF0D1B2A), // سرمه‌ای تیره بالا
                      Color(0xFF1B263B), // آبی خاکستری پایین
                    ]
                  : const [
                      Color(0xFF6DD5FA), // آبی روشن بالا
                      Color(0xFF2980B9), // آبی تیره پایین
                    ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: const SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Header(isDark: false),
                  SizedBox(height: 25),
                  WeatherBox(),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ForecastSection(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
