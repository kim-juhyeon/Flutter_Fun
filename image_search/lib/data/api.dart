import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_search/data/photo_api_repository.dart';
import 'package:image_search/model/photo.dart';

class PixabayApi implements PhotoApiRepository{
  final baseUrl = 'https://pixabay.com/api/';
  final key = '41923496-53f97cf4eb13465e0f49b967e';
  Future<List<Photo>> fetch(String query) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?key=$key&q=$query&image_type=photo'));
    //final response 는 작명한게 아닌 http에서 제공하는 객체입니다.
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    Iterable hits = jsonResponse['hits']; //Iterable로 받으면 반복을 할 수 있습니다.
    return hits
        .map((e) => Photo.fromJson(e))
        .toList(); //map 형태인 hit를 Photo 형태 객체로 변환을 해줍니다. 그리고 List에 담습니다.
  }
}
