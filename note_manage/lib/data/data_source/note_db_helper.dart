import 'package:note_manage_app/domain/model/note.dart';
import 'package:sqflite/sqlite_api.dart';

class NoteDbHelper {
  Database db;

  NoteDbHelper(this.db);

  Future<Note?> getNoteById(int id) async {
    // SELECT * FROM note WHERE id = 1
    final maps = await db.query('note', where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Note.fromJson(maps.first);
    }
    return null;
  }

  Future<List<Note>> getNotes() async {
    final maps = await db.query('note');
    return maps
        .map((e) => Note.fromJson(e))
        .toList(); //쿼리 형태가 json 형태로 되어 있으니, fromJson으로 toList 해준다.
  }

  Future<void> insertNote(Note note) async {
    await db.update(
      'note',
      note.toJson(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<void> updateNote(Note note) async{
    await db.update('note',note.toJson(),where: 'id = ?', whereArgs: [note.id]);
  }

  Future<void> deletedNote(Note note) async {
    await db.delete('note', where: 'id = ? ', whereArgs: [note.id]);
  }
}
