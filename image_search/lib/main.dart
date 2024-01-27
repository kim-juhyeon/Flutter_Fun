import 'package:flutter/material.dart';
import 'package:image_search/data/data_source/pixabay_api.dart';
import 'package:image_search/data/repository/photo_repository_impl.dart';
import 'package:image_search/domain/repository/photo_api_repository.dart';
import 'package:image_search/data/photo_provider.dart';
import 'package:image_search/presentation/home/home_screen.dart';
import 'package:image_search/presentation/home/home_view_model.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => HomeViewModel(PhotoApiRepositoryImpl(PixabayApi(http.Client()))),
        child: const HomeScreen(),
      ),
    );
  }
}
///TODO
///사용자가 HomeScreen에서 데이터를 요청합니다.
// HomeViewModel은 PhotoApiRepository 인터페이스를 통해 데이터를 요청합니다.
// PhotoApiRepositoryImpl 구현체는 PixabayApi를 사용하여 실제 데이터를 가져옵니다.
// 가져온 데이터는 HomeViewModel을 통해 UI에 표시됩니다.