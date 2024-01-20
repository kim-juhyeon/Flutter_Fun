import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_search/model/Photo.dart';
import 'package:image_search/ui/widget/photo_widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller =  TextEditingController();
  List<Photo> _photos = [];
 //빈 리스트로 두었다가 변환된 Photo 를 Photos에 담는다.
  Future<List<Photo>> fetch(String query) async{
    final response = await http.get(Uri.parse('https://pixabay.com/api/?key=41923496-53f97cf4eb13465e0f49b967e&q=$query&image_type=photo'));
    //final response 는 작명한게 아닌 http에서 제공하는 객체입니다.
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits =  jsonResponse['hits']; //Iterable로 받으면 반복을 할 수 있습니다.
    return hits.map((e) => Photo.fromJson(e)).toList(); //map 형태인 hit를 Photo 형태 객체로 변환을 해줍니다. 그리고 List에 담습니다.
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '이미지 검색 앱',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    final photos = await fetch(_controller.text);  //photos 는 작명이지만 역할이 있습니다. fetch 를 받는 pohto 모델의 photos 입니다.
                    setState(() {
                      _photos = photos; //controller.text 사용자 입력에 따라 pthos 가 _photos에 들어가면서 화면이 다시 그려지게 됩니다.
                    });

                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.0),
              shrinkWrap: true,
              itemCount: _photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16, //간격조절
              ),
              itemBuilder: (context, index) {
                final photo = _photos[index];
                return PhotoWidget(photo: photo);
              },
            ),
          )
        ],
      ),
    );
  }
}
