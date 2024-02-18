

import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:note_manage_app/data/data_source/note_db_helper.dart';
import 'package:note_manage_app/domain/model/note.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main(){
  test('db test', ()  async {
    final db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath); //메모리에 저장하고 해당 값을 이용

    await db.execute('CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');

    final noteDbHelper = NoteDbHelper(db);

    await noteDbHelper.insertNote(Note(
      title : 'test',
      content : 'test',
      color : 1,
      timeStamp: 1,
    ));
    
    expect((await noteDbHelper.getNotes()).length, 1); //expect를 통해 검사를 합니다. 기존에 noteDbHelper로 getNotes를 가져와서 길이가 잘 가져오는지 확인
    Note note = (await noteDbHelper.getNoteById(1))!;
    expect(note,1);
    await noteDbHelper.updateNote(note.copyWith(   //note를 freezed로 생성했기 때문에 불변 객체이므로 copywith으로 객체를 수정할 수 있습니다.
      title: 'change'
    ));
    expect(note.title, 'change');

    await noteDbHelper.deletedNote(note);
    expect((await noteDbHelper.getNotes()).length,0);
    await db.close();
  });
}