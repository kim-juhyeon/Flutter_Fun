import 'dart:convert';

import 'package:http/http.dart' as http;
class PixabayApi {
  final http.Client client;

  PixabayApi(this. client);

  static const baseUrl = 'https://pixabay.com/api/';
  static const key = '41923496-53f97cf4eb13465e0f49b967e';

  Future<List<Map<String,dynamic>>> fetch(String query) async{
    final response =  await client.get(Uri.parse(
        '$baseUrl?key=$key&q=$query&image_type=photo'));
    Map<String,dynamic> jsonResponse = jsonDecode(response.body);
    List<Map<String,dynamic>> hits = jsonResponse['hits'];
    return hits;
  }
}