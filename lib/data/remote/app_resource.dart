import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_resource.freezed.dart';

class MyState<T> {
  T value;

  MyState._();

  factory MyState.success(String foo) = MySuccessState;
  factory MyState.error(String foo) = MyErrorState;
}

class MyErrorState extends MyState {
  MyErrorState(this.msg): super._();

  final String msg;
}

class MySuccessState<T> extends MyState<T> {
  MySuccessState(this.value): super._();

  @override
  final T value;
}