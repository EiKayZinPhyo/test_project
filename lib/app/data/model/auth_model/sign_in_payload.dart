import 'package:json_annotation/json_annotation.dart';

part 'sign_in_payload.g.dart';

@JsonSerializable()
class SignInPayLoad {
  SignInPayLoad({
    required this.email,
    required this.password,
  });

  final String? email;
  final String? password;

  factory SignInPayLoad.fromJson(Map<String, dynamic> json) => _$SignInPayLoadFromJson(json);

  Map<String, dynamic> toJson() => _$SignInPayLoadToJson(this);

}
