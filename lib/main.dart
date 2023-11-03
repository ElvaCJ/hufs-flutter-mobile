import 'package:flutter/material.dart';
import 'package:mobile_project/screens/nav_test_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      home: HomeWidget(),
    ),
  );
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidget();
}

class _HomeWidget extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NavTestScreen()),
          ),
          child: const Text(
            'Move To Navigation Page',
            style: TextStyle(
              fontSize: 26,
            ),
          ),
        ),
      ),
    );
  }
}
