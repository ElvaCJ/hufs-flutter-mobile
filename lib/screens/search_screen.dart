import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();
  late String inputText = '';
  late String receivedText = '';
  List<String> items = [''];

  void searchNaverLocal(String text) async {
    Dio dio = Dio();

    String clientId = dotenv.get("NAVER_CLIENT_ID");
    String clientSecret = dotenv.get("NAVER_CLIENT_SECRET");

    dio.options.headers['X-Naver-Client-Id'] = clientId;
    dio.options.headers['X-Naver-Client-Secret'] = clientSecret;

    String str =
        'https://openapi.naver.com/v1/search/local.json?query=$text&display=10&start=1&sort=random';
    Response response;
    response = await dio.get(str);
    print(response.data.toString());
    var searchData = jsonDecode(response.toString());
    int total = searchData['total'];

    items.clear();
    for (int i = 0; i < total; i++) {
      setState(() {
        // receivedText = response.data().toString();
        items.add(searchData['items'][i].toString());
        print(items[i]);
      });
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naver Search Screen'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextField(
                  controller: textEditingController,
                  onChanged: (text) {
                    // onChanged() : txt값이 바뀔 때마다 작동하는 메서드
                    setState(() {
                      inputText = text; // 1.받은 txt값을
                    });
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  searchNaverLocal(inputText); // 2.searchNaverLocal()로 연결
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.greenAccent[700],
                  ),
                  margin: const EdgeInsets.symmetric(
                    horizontal: 6.0,
                    vertical: 8.0,
                  ),
                  child: Container(
                    height: 50,
                    width: 50,
                    alignment: Alignment.center,
                    child: const Text('검색'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('$items[0]'),
            ],
          ),
        ],
      ),
    );
  }
}
