import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textStyle = const TextStyle(fontSize: 16.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getNumber(),
        //setstate가 없어도 새로고침시 자동으로 출력값이 변경된다. future 함수만을 통해서 가능
        builder: (context, snapshot) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'FutreBuider',
                  style: textStyle.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  'ConState : ${snapshot.connectionState}',
                  //snapshot 상태
                  style: textStyle,
                ),
                Text(
                  'Data : ${snapshot.data}',
                  style: textStyle,
                ),
                Text(
                  'Error :${snapshot.error}',
                  style: textStyle,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: Text('setState'),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<int> getNumber() async {
    await Future.delayed(const Duration(seconds: 3));
    final random = Random();

    throw Exception('에러가 발생했습니다.');
    //error 값을 전달 할 수 있음

    //return random.nextInt(100);
  }
}
