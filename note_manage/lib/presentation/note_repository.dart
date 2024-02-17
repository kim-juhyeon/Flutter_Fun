import 'package:note_manage_app/domain/model/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();

  Future<Note> getNoeById(int id);

  Future<void> insertNote(Note note);

  Future<void> updateNote(Note note);

  Future<void> deletNote(Note note);
}