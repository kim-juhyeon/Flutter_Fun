import 'package:book_list/wigets/book_tile.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('도서 목록 앱'),
      ),
      body: ListView(
        children: const <Widget>[
          BookTile(
            title: '다른 사람의 말을 잘 기울여라',
            subtitle: '혜민 스님이 전하는 글귀',
            description: '항상 건강하고 행복하셔야 합니다.',
            image:
                'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAxMTlfMjE2%2FMDAxNjc0MTEzNDc1MDU1.PnOQfKnomoEYvCfriNfcNhn6ZFpiTLPyMGcB2Oi-i-gg.a93krvkFF6dtwwrHGmw3Q9YOP-vzQ1oC4cS2UZE7ZKgg.PNG.hey7496%2Fimage.png',
          ),
          BookTile(
            title: '다른 사람의 말을 잘 기울여라',
            subtitle: '혜민 스님이 전하는 글귀',
            description: '항상 건강하고 행복하셔야 합니다.',
            image:
                'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAxMTlfMjE2%2FMDAxNjc0MTEzNDc1MDU1.PnOQfKnomoEYvCfriNfcNhn6ZFpiTLPyMGcB2Oi-i-gg.a93krvkFF6dtwwrHGmw3Q9YOP-vzQ1oC4cS2UZE7ZKgg.PNG.hey7496%2Fimage.png',
          ),
          BookTile(
            title: '다른 사람의 말을 잘 기울여라',
            subtitle: '혜민 스님이 전하는 글귀',
            description: '항상 건강하고 행복하셔야 합니다.',
            image:
                'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAxMTlfMjE2%2FMDAxNjc0MTEzNDc1MDU1.PnOQfKnomoEYvCfriNfcNhn6ZFpiTLPyMGcB2Oi-i-gg.a93krvkFF6dtwwrHGmw3Q9YOP-vzQ1oC4cS2UZE7ZKgg.PNG.hey7496%2Fimage.png',
          ),
          BookTile(
            title: '다른 사람의 말을 잘 기울여라',
            subtitle: '혜민 스님이 전하는 글귀',
            description: '항상 건강하고 행복하셔야 합니다.',
            image:
                'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAxMTlfMjE2%2FMDAxNjc0MTEzNDc1MDU1.PnOQfKnomoEYvCfriNfcNhn6ZFpiTLPyMGcB2Oi-i-gg.a93krvkFF6dtwwrHGmw3Q9YOP-vzQ1oC4cS2UZE7ZKgg.PNG.hey7496%2Fimage.png',
          ),
        ],
      ),
    );
  }
}
