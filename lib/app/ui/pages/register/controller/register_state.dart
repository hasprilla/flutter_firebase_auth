// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';
// part 'register_state.g.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    @Default('') String email,
    @Default('') String password,
    @Default('') String vPassword,
    @Default('') String name,
    @Default('') String lastName,
    @Default(false) bool termsOk,
  }) = _RegisterState;

  static RegisterState get initialState => RegisterState();
}
