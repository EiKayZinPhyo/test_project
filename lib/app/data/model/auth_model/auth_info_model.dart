import 'package:equatable/equatable.dart';

class AuthInfoModel extends Equatable {
  const AuthInfoModel({
    required this.currentPersonFormInformationId,
    required this.email,
    required this.personFormInformation,
    required this.userId,
    required this.accessToken,
    required this.refreshToken,
  });

  final String? currentPersonFormInformationId;
  final String? email;
  final PersonFormInformation? personFormInformation;
  final String? userId;
  final String? accessToken;
  final String? refreshToken;

  AuthInfoModel copyWith({
    String? currentPersonFormInformationId,
    String? email,
    PersonFormInformation? personFormInformation,
    String? userId,
    String? accessToken,
    String? refreshToken,
  }) {
    return AuthInfoModel(
      currentPersonFormInformationId: currentPersonFormInformationId ?? this.currentPersonFormInformationId,
      email: email ?? this.email,
      personFormInformation: personFormInformation ?? this.personFormInformation,
      userId: userId ?? this.userId,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  factory AuthInfoModel.fromJson(Map<String, dynamic> json){
    return AuthInfoModel(
      currentPersonFormInformationId: json["current_person_form_information_id"],
      email: json["email"],
      personFormInformation: json["person_form_information"] == null ? null : PersonFormInformation.fromJson(json["person_form_information"]),
      userId: json["user_id"],
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
    );
  }

  Map<String, dynamic> toJson() => {
    "current_person_form_information_id": currentPersonFormInformationId,
    "email": email,
    "person_form_information": personFormInformation?.toJson(),
    "user_id": userId,
    "access_token": accessToken,
    "refresh_token": refreshToken,
  };

  @override
  String toString(){
    return "$currentPersonFormInformationId, $email, $personFormInformation, $userId, $accessToken, $refreshToken, ";
  }

  @override
  List<Object?> get props => [
    currentPersonFormInformationId, email, personFormInformation, userId, accessToken, refreshToken, ];
}

class PersonFormInformation extends Equatable {
  const PersonFormInformation({
    required this.id,
    required this.name,
    required this.register,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  final String? id;
  final String? name;
  final bool? register;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  PersonFormInformation copyWith({
    String? id,
    String? name,
    bool? register,
    String? userId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return PersonFormInformation(
      id: id ?? this.id,
      name: name ?? this.name,
      register: register ?? this.register,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory PersonFormInformation.fromJson(Map<String, dynamic> json){
    return PersonFormInformation(
      id: json["id"],
      name: json["name"],
      register: json["register"],
      userId: json["user_id"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "register": register,
    "user_id": userId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };

  @override
  String toString(){
    return "$id, $name, $register, $userId, $createdAt, $updatedAt, ";
  }

  @override
  List<Object?> get props => [
    id, name, register, userId, createdAt, updatedAt, ];
}
