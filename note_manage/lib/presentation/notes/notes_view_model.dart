import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:note_manage_app/domain/model/note.dart';
import 'package:note_manage_app/domain/repository/note_repository.dart';
import 'package:note_manage_app/presentation/notes/notes_event.dart';
import 'package:note_manage_app/presentation/notes/notes_state.dart';

class NotesViewModel with ChangeNotifier {
  final NoteRepository repository;
  NotesState _state = NotesState(notes: []);

  NotesState get state => _state;

  // List<Note> _notes = [];
  // UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes); //_notes 변경할 수 없는 형태로 접근을 합니다.

  Note? _recentlyDeletedNote;

//3가지 기능 불러오기, 지우기 , 지우기 취소
  NotesViewModel(this.repository);

  void onEvent(NotesEvent event) {
    //freezed는 when을 지원해줌
    event.when(
      loadNotes: _loadNotes,
      deletNote: _deleteNote,
      restoreNote: restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await repository.getNotes();
    _state = state.copyWith(
      notes: notes,
    );
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await repository.deletNote(note);
    _recentlyDeletedNote = note;
    await _loadNotes();
  }

  Future<void> restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await repository.insertNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}
