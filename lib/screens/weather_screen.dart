import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Position? position;

  //1. 불러올 정보 데이터를 할당할 변수들 선언
  late double latitude;
  late double longitude;
  late double temperature;
  late String city;

  @override
  void initState() {
    super.initState();

    // 2. 정보 데이터 변수 초기화
    longitude = 0;
    latitude = 0;
    city = '';
    temperature = 0;

    getPosition();
  }

  // Current Weather Data API 호출
  Future<void> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled =
        await Geolocator.isLocationServiceEnabled(); //await -> 함수 탈출 후 따로 돌아감
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    position = await Geolocator.getCurrentPosition();
    setState(() {
      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.

      latitude = position!.latitude;
      longitude = position!.longitude;

      getWeather(latitude.toString(), longitude.toString());
    });

    // 필요 데이터 잘 불러왔는지 중간확인 : 콘솔 출력
    print(position);
    print('latitude : $latitude');
    print('longitude : $longitude');
  }

  void getWeather(@required String lat, @required String lon) async {
    final dio = Dio();
    String apiKey = dotenv.get("WEATHER_KEY");
    String str = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';
    Response response;
    response = await dio.get(str);
    print(response.data.toString());

    var weatherData = jsonDecode(response.toString()); // string을 List로 바꿔주기 위한 jsonDecode(dart.convert 패키지에 있는 메소드)
    double temp = weatherData['main']['temp'];
    String name = weatherData['name'];

    setState(() {
      temperature = temp - 273.15; //절대온도로 호출된 temp를 섭씨온도로 바꿔주기
      city = name;
    });

    print(temp.toString());
    print(name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('위도 : $latitude ', style: const TextStyle(fontSize: 18),),
            Text('경도 : $longitude ', style: const TextStyle(fontSize: 18),),
            Text('도시 : $city ', style: const TextStyle(fontSize: 27),),
            Text('현재 온도 : ${temperature.toStringAsFixed(2)} ', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
