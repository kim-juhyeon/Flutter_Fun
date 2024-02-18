import 'package:note_manage_app/domain/model/note.dart';
//일반적으로 노트앱에서 사용할 수 있는 기능을 정리
abstract class NoteRepository {
  Future<List<Note>> getNotes();

  Future<Note?> getNoeById(int id); //id를 가져와서 수정할 수 있게

  Future<void> insertNote(Note note);

  Future<void> updateNote(Note note);

  Future<void> deletNote(Note note);
}