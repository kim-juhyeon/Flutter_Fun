import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/data_source/result.dart';
import 'package:image_search/domain/model/photo.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

//에러 진행 List<Photo> 를 바로 받기보다는 예외처리를 진행해야 좋다.
  @override
  Future<Result<List<Photo>>> fetch(String query) async {
    final Result<Iterable> result = await api.fetch(query);
    //Freezed를 이용하게 되면 when 을 이용할 수 있음
    return result.when(
      success: (iterable) {
       return Result.success(iterable.map((e) => Photo.fromJson(e)).toList());
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }
}

///TODO PixabayApi를 가져와서 json 데이터를 변환해주고 PHOTO 모델에 넣어주는 로직입니다.
