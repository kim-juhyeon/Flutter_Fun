import 'package:flutter/material.dart';

import '../models/book.dart';

class DetailScreen extends StatelessWidget {
  final Book book;
  DetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    // context 맥락을 정해는 거
    return Scaffold(
      appBar: AppBar(
        title: Text('책 제목'),
      ),
      body: Column(
        children: [
          Image.network(
              "https://contents.lotteon.com/itemimage/_v073329/LI/16/13/20/99/21/_1/LI1613209921_1_1.jpg/dims/resizef/720X720"),
          Padding(
            padding: EdgeInsets.all(3), //4분면 (위,아래,왼,우 면의 여백을 전체 주겠다. all)
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, // 수직의 첫번째
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 수평의 중간
            children: [
              Container(
                width: MediaQuery.of(context).size.width *
                    0.8, //mediaQuery - 디바이스 크기에 따라서 width,height를 잡아주는 class이다.
                padding:
                    EdgeInsets.all(10), // 컨테이너 안에 있는 child값의 4분면 all을 의미한다.
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // child의 수평방향 왼쪽정렬
                  children: [
                    Container(
                      child: Text(
                        '패키지 없이 R로 구현하는 심층 강화학습',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      '기대가 됩니다',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.15, //
                padding: EdgeInsets.all(10), //row값의 정렬을 의미한다.
                child: Center(
                  child: Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(3),
          ),
          Row(
            //상위에서 row 를 주어 아이콘 배열을 진행
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.blue,
                  ),
                  Text(
                    'Contact',
                    style: TextStyle(color: Colors.blue),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.near_me,
                    color: Colors.blue,
                  ),
                  Text(
                    'Route',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.save,
                    color: Colors.blue,
                  ),
                  Text(
                    "save",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  )
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Text("꾸준하게 잘 해보자요~"),
          ),
        ],
      ),
    );
  }
}
