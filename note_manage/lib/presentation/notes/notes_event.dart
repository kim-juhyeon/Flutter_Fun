//notes_view_model에 ChangeNotifier를 이용해서, 사용자 동작을 전부 써줘야 하는데 앱이 커지게 되면 그렇게 하기가 쉽지 않기 때문에 envet 페이지를 따로 만들어서 관리할 수 있습니다.

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:note_manage_app/domain/model/note.dart';
part 'notes_event.freezed.dart';
///enum 클래스를 사용해도 여러가지 기능들을 선언해서 사용할 수 있지만, 봉인 클래스의 장점은 데이터를 받을 수 있습니다.
@freezed
abstract class NotesEvent with _$NotesEvent {
  const factory NotesEvent.loadNotes() = LoadNotes;
  const factory NotesEvent.deletNote(Note note) = DeleteNote;
  const factory NotesEvent.restoreNote() = RestoreNote;
}