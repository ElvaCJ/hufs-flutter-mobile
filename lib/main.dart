import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_project/screens/nav_test_screen.dart';

void main() {

  // 라이브러리 사용 초기화
  // Flutter Engine과의 상호작용을 위해 사용됨
  // 플러그인 calls 비동기 작동 플랫폼 채널 which calls 네이티브 코드 which is necessary for initializing Firebase
  WidgetsFlutterBinding.ensureInitialized();
  dotenv.load(fileName: ".env");

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
