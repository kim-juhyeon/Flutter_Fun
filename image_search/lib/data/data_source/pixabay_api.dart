import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:image_search/data/data_source/result.dart';

class PixabayApi {
  final http.Client client;

  PixabayApi(this.client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '41923496-53f97cf4eb13465e0f49b967e';

  Future<Result<Iterable>> fetch(String query) async {
    try {
      final response = await client
          .get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      Iterable hits = jsonResponse['hits'];
      return Result.success(hits);
    }catch(e){
      return Result.error('네트워크 오류');
    }
  }

// Future<List<Map<String,dynamic>>> fetch(String query) async{
//   final response =  await client.get(Uri.parse(
//       '$baseUrl?key=$key&q=$query&image_type=photo'));
//   Map<String,dynamic> jsonResponse = jsonDecode(response.body);
//   List<Map<String,dynamic>> hits = jsonResponse['hits'];
//   return hits;
}
