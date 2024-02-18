import 'package:note_manage_app/data/data_source/note_db_helper.dart';
import 'package:note_manage_app/domain/model/note.dart';
import 'package:note_manage_app/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository{
  final NoteDbHelper db;

  NoteRepositoryImpl(this.db);

  @override
  Future<void> deletNote(Note note) async{
    await db.deletedNote(note);
  }

  @override
  Future<Note?> getNoeById(int id) async{
    return await db.getNoteById(id);
  }

  @override
  Future<List<Note>> getNotes()async {
    return await db.getNotes();
  }

  @override
  Future<void> insertNote(Note note) async{
   await db.insertNote(note);
  }

  @override
  Future<void> updateNote(Note note) async {
    await db.updateNote(note);
  }
}