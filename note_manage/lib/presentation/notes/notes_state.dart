import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_manage_app/domain/model/note.dart';

part 'notes_state.freezed.dart';
part 'notes_state.g.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
   required List<Note> notes, // notes가 notes_view_model에서 중복으로 갱신때문에 쓰이기 때문에 따로 빼서 진행
}) = _NotesState;
  factory NotesState.fromJson(Map<String, dynamic> json) => _$NotesStateFromJson(json);
}