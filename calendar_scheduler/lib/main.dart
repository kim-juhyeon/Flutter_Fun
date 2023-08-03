import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:calendar_scheduler/database/drift_database.dart'; 

void main() async {
  WidgetsFlutter             Binding.ensureInitialized();
  //초기화가 되었는지 확인 runapp을 실행하면 실행되는 함수 이지만 runapp 실행전에 실행해야 할 로직이 있으므로 그전에 넣어준다.

  await initializeDateFormatting();

  final database = LocalDatabase();

  print('--------get colors------');
  print(await database.getCatetoryColors());

  runApp(
    MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      home: HomeScreen(),
    ),
  );
}
