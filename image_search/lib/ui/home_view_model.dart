import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image_search/data/api.dart';
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];

  UnmodifiableListView<Photo> get photos =>
      UnmodifiableListView(
          _photos); //내부적으로는 수정할 수 있게 하지만, 외부에서는 photos를 수정하지 못하게 합니다.

  HomeViewModel(this.repository);


  Future<void> fetch(String query) async {
    final result = await repository.fetch(query);
    _photos = result;
    notifyListeners(); //감시하는 곳에 화면을 다시 그려지게 합니다.
  }
}