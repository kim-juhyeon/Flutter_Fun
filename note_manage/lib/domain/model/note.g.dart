// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoteImpl _$$NoteImplFromJson(Map<String, dynamic> json) => _$NoteImpl(
      title: json['title'] as String,
      content: json['content'] as String,
      color: json['color'] as int,
      timeStamp: json['timeStamp'] as int,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$NoteImplToJson(_$NoteImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'color': instance.color,
      'timeStamp': instance.timeStamp,
      'id': instance.id,
    };
