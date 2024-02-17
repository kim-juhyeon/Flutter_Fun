

import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

//freezed로 하는 이유는 불변객체로 만들어주고, tojson, fromjson으로 만들어주는 것 그리고 copy 메서드까지 제공
@freezed
class Note with _$Note {
  factory Note({
    required String title,
    required String content,
    required int color,
    required int timeStamp,
    int? id,
}) = _Note;
  factory Note.fromJson(Map<String,dynamic> json) => _$NoteFromJson(json);
}