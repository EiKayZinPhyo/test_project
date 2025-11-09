// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInPayLoad _$SignInPayLoadFromJson(Map<String, dynamic> json) =>
    SignInPayLoad(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$SignInPayLoadToJson(SignInPayLoad instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};
