import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_resource.freezed.dart';

@freezed
class AppResource<T> with _$AppResource<T>{

  const factory AppResource.success(T value) = Success<T>;
  const factory AppResource.loading() = Loading<T>;
  const factory AppResource.error([String? message]) = Error<T>;
}