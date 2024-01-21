import 'dart:async';

import 'package:image_search/data/api.dart';
import 'package:image_search/model/Photo.dart';

class HomeViewModel {
  final  PixabayApi api;

  final _photoScreamController = StreamController<List<Photo>>()..add([]); //기존 photo를 담아주는 데이터를 없에고 controller로 대체합니다. 최초에는 데이터가 없으므로 circulr가 보이는데 add를 추가하여 빈 값을 출력하게 합니다.
  Stream<List<Photo>> get photoStream => _photoScreamController.stream;

  HomeViewModel(this.api);
  Future<void> fetch(String query) async {
    final result = await api.fetch(query);
    _photoScreamController.add(result);
  }
}