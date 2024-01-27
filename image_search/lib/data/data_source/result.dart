import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';
@freezed
abstract class Result<T> with _$Result<T>{ //결과는 어떤 타입으로도 가능하게 제너릭으로 진행
  const factory Result.success(T data) = Success;
  const factory Result.error(String e) = Error;
}