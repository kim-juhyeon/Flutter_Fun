import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

/// 홈 페이지
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String quiz = ""; //보여줄 퀴즈

  /// Number API
  Future<String> getNumberTrivia() async {
    Response result = await Dio().get('http://numbersapi.com/random/trivia');
    String trivia = result.data;
    print(trivia);
    return trivia;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        color: Colors.pinkAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // quiz
            Expanded(
              child: Center(
                child: Text(
                  "quiz",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // New Quiz 버튼
            SizedBox(
              height: 42,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () async {
                  // New Quiz 클릭시 퀴즈 가져오기
                  String trivia = await getNumberTrivia();
                  setState(() {
                    //화면을 갱신해야 하므로 setstate
                    quiz = trivia;
                  });
                  //가
                  // New Quiz 클릭시 퀴즈 가져오기
                },
                child: Text(
                  "New Quiz",
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
