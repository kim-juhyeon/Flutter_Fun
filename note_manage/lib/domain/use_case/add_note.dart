import 'package:note_manage_app/domain/model/note.dart';
import 'package:note_manage_app/domain/repository/note_repository.dart';

class AddNote{
  final NoteRepository repository;

  AddNote(this.repository);

  Future<void> call(Note note) async{
    await repository.insertNote(note);
  }
}