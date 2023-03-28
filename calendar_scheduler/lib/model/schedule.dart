import 'package:drift/drift.dart';

class Schedules extends Table {
  //PRIARY KEY
  IntColumn get id => integer().autoIncrement()();
  //id는 table에서 최조 지정 값이므로 중요함 aoutoinvrement를 이용시 숫자를 자동 배정해줌
  //내용
  TextColumn get content => text()();
  //일정 날짜
  DateTimeColumn get date => dateTime()();

  //시작 시간
  IntColumn get startTime => integer()();

  //끝 시간
  IntColumn get endTime => integer()();

  // Category Color Table ID
  IntColumn get colorID => integer()();

  //생성날짜
  //현재 날짜 출력 따로 table에 값을 넣을 필요가 없음
  DateTimeColumn get createdAt => dateTime().clientDefault(
        () => DateTime.now(),
      )();
}
