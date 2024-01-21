import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/model/photo.dart';
import 'package:image_search/ui/widget/photo_widget.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final api = PixabayApi();
  final _controller =  TextEditingController();
  // List<Photo> _photos = [];
 //빈 리스트로 두었다가 변환된 Photo 를 Photos에 담는다.


  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = PhotoProvider.of(context).viewModel; //of의 함수를 지정해줘서 context를 제공합니다. InheritedWidget의 of
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
                    viewModel.fetch(_controller.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          StreamBuilder<List<Photo>>(
            stream: viewModel.photoStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData){
                return const CircularProgressIndicator();
              }
              final photos = snapshot.data!;
              return Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(16.0),
                  shrinkWrap: true,
                  itemCount: photos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16, //간격조절
                  ),
                  itemBuilder: (context, index) {
                    final photo = photos[index];
                    return PhotoWidget(photo: photo);
                  },
                ),
              );
            }
          )
        ],
      ),
    );
  }
}
