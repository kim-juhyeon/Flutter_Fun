import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // context 맥락을 정해는 거
    return Scaffold(
      appBar: AppBar(
        title: const Text('책 제목'),
      ),
      body: Column(
        children: [
          Image.network(
              "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAxMTlfMjE2%2FMDAxNjc0MTEzNDc1MDU1.PnOQfKnomoEYvCfriNfcNhn6ZFpiTLPyMGcB2Oi-i-gg.a93krvkFF6dtwwrHGmw3Q9YOP-vzQ1oC4cS2UZE7ZKgg.PNG.hey7496%2Fimage.png"),
          const Padding(
            padding: EdgeInsets.all(3), //4분면 (위,아래,왼,우 면의 여백을 전체 주겠다. all)
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, // 수직의 첫번째
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // 수평의 중간
            children: [
              Container(
                padding: const EdgeInsets.all(
                    12), // 컨테이너 안에 있는 child값의 4분면 all을 의미한다.
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // child의 수평방향 왼쪽정렬
                  children: [
                    Container(
                      child: const Text(
                        '패키지 없이 R로 구현하는 심층 강화학습',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Text(
                      '기대가 됩니다',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10), //row값의 정렬을 의미한다.
                child: const Center(
                  child: Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
