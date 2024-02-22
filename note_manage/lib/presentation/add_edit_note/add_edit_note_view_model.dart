import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_manage_app/domain/model/note.dart';
import 'package:note_manage_app/domain/repository/note_repository.dart';
import 'package:note_manage_app/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:note_manage_app/ui/colors.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  int _color = roseBud.value;

  int get color => _color;

  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    event.when(
      changeColor: _changColor,
      saveNote: _saveNote,
    );
  }

  Future<void> _changColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (id == null) {
      repository.insertNote(
        Note(
          title: title,
          content: content,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
          color: _color,
        ),
      );
    } else {
      await repository.updateNote(
        Note(
          id: id,
          title: title,
          content: content,
          timeStamp: DateTime.now().millisecondsSinceEpoch,
          color: _color,
        ),
      );
    }
  }
}
