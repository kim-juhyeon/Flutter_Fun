import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:image_search/data/data_source/result.dart';

import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/presentation/home/home_ui_event.dart';

class HomeViewModel with ChangeNotifier {
  final PhotoApiRepository repository;

  List<Photo> _photos = [];

  UnmodifiableListView<Photo> get photos => UnmodifiableListView(
      _photos); //내부적으로는 수정할 수 있게 하지만, 외부에서는 photos를 수정하지 못하게 합니다.

  final _eventController = StreamController<HomeUiEvent>(); ///인터넷 연결이 안될 시 호출하는 event
  Stream<HomeUiEvent> get eventStream => _eventController.stream;

  HomeViewModel(this.repository);


  Future<void> fetch(String query) async {
    final Result<List<Photo>> result = await repository.fetch(query);
    result.when(
      success: (photos) {
        _photos = photos;
        notifyListeners(); //감시하는 곳에 화면을 다시 그려지게 합니다.
      },
      error: (message) {
        _eventController.add(HomeUiEvent.showSnackBar(message));
      },
    );


  }
}
