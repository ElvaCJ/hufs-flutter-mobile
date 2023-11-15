import 'package:flutter/material.dart';
import 'package:mobile_project/main.dart';
import 'package:mobile_project/screens/input_test_screen.dart';
import 'package:mobile_project/screens/test_widget_screen.dart';
import 'package:mobile_project/screens/weather_screen.dart';

class NavTestScreen extends StatefulWidget {
  const NavTestScreen({super.key});

  @override
  State<NavTestScreen> createState() => _NavTestScreen();
}

class _NavTestScreen extends State<NavTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nav Test Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text(
                '초기화면으로',
                style: TextStyle(fontSize: 26),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const HomeWidget()),
              ),
              child: const Text(
                'back to Home',
                style: TextStyle(fontSize: 26),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const TestWidgetScreen()),
              ),
              child: const Text(
                'Test Widget Screen',
                style: TextStyle(fontSize: 26),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const InputTestScreen()),
              ),
              child: const Text(
                'Test Input Screen',
                style: TextStyle(fontSize: 26),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WeatherScreen()),
              ),
              child: const Text(
                'Weather API',
                style: TextStyle(fontSize: 26),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
