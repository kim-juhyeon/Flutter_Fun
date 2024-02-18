import 'package:flutter/foundation.dart';
import 'package:note_manage_app/domain/repository/note_repository.dart';
import 'package:note_manage_app/presentation/notes/notes_event.dart';

class NotesViewModel with ChangeNotifier {
  final NoteRepository repository;
//3가지 기능 불러오기, 지우기 , 지우기 취소
  NotesViewModel(this.repository);

  void onEvent(NotesEvent event){ //freezed는 when을 지원해줌
    event.when(loadNotes: (){}, deletNote: (note){}, restoreNote: (){},)
  }
}