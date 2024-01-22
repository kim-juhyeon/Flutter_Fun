import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';


class PhotoApiRepositoryImpl implements PhotoApiRepository{
  PixabayApi api;
  PhotoApiRepositoryImpl(this.api);

  @override
  Future<List<Photo>> fetch(String query) async{
    final result = await api.fetch(query);
    return result.map((e) => Photo.fromJson(e)).toList();
  }
}
///TODO PixabayApi를 가져와서 json 데이터를 변환해주고 PHOTO 모델에 넣어주는 로지깅빈다.