import 'package:note_manage_app/domain/model/note.dart';
import 'package:note_manage_app/domain/repository/note_repository.dart';

class UpdatedNote {
  final NoteRepository repository;

  UpdatedNote(this.repository);

  Future<void> call(Note note) async{
    await repository.updateNote(note);
  }
}