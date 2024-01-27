import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:image_search/presentation/home/component/photo_widget.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription? _subscription;
  // final api = PixabayApi();
  final _controller =  TextEditingController();
  // List<Photo> _photos = [];
 //빈 리스트로 두었다가 변환된 Photo 를 Photos에 담는다.
@override
  void initState() {
    super.initState();
    Future.microtask((){
      final viewmodel = context.read<HomeViewModel>();
      _subscription = viewmodel.eventStream.listen((event) {
        event.when(showSnackBar: (message){
          final snackBar = SnackBar(content: Text(message));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    // TODO: implement dispose
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>(); //provider
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
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16.0),
              shrinkWrap: true,
              itemCount:viewModel.photos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16, //간격조절
              ),
              itemBuilder: (context, index) {
                final photo = viewModel.photos[index];
                return PhotoWidget(photo: photo);
              },
            ),
          )
        ],
      ),
    );
  }
}
