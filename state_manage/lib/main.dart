import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_manage/screen/home_screen.dart';

void main() {
  runApp(
    //providerScope가 상위에 있어야 실행이 가능하다.
    ProviderScope(
      child: MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
