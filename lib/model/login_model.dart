import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_model.freezed.dart';

@freezed
class LoginModel with _$LoginModel{
  factory LoginModel({
    String? userName,
    String? password,
  })=_LoginModel;
}