import 'package:calendar_scheduler/model/category_color.dart';
import 'package:calendar_scheduler/model/schedule.dart';
import 'package:drift/drift.dart';
// import는 private 값들을 불러올 수 없음 , part는 가능
part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Schedules,
    CategoryColors,
  ],

)
class LocalDatabase extends _$LocalDatabase{
  LocalDatabase() : super(_openConnection());
  
}

LazyDatabase _openConnection(){
  return LazyDatabase(()async{
    final dbFolder = await

  });
  
}