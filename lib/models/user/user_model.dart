import 'user_model_entity.dart';

class UserModel {
  final String id;
  final String name;
  String? email;
  final String imageUrl;
  final String username;
  final String password;
  final String document;
  final String phone;
  final String city;
  final String gender;
  final DateTime birthDate;
  final String sponsor;

  UserModel({
    required this.id,
    required this.name,
    this.email,
    required this.imageUrl,
    required this.username,
    required this.password,
    required this.document,
    required this.phone,
    required this.city,
    required this.gender,
    required this.birthDate,
    required this.sponsor,
  });

  static final empty = UserModel(
    id: '',
    name: '',
    email: '',
    imageUrl: '',
    username: '',
    password: '',
    document: '',
    phone: '',
    city: '',
    gender: '',
    birthDate: DateTime.now(),
    sponsor: '',
  );

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? imageUrl,
    String? username,
    String? password,
    String? document,
    String? phone,
    String? city,
    String? gender,
    DateTime? birthDate,
    String? sponsor,
  }) {
    return UserModel(
      id: id ?? this.id, 
      name: name ?? this.name, 
      imageUrl: imageUrl ?? this.imageUrl, 
      username: username ?? this.username, 
      password: password ?? this.password, 
      document: document ?? this.document, 
      phone: phone ?? this.phone, 
      city: city ?? this.city, 
      gender: gender ?? this.gender, 
      birthDate: birthDate ?? this.birthDate, 
      sponsor: sponsor ?? this.sponsor,
    );
  }

  bool get isEmpty => this == UserModel.empty;

  bool get isNotEmpty => this != UserModel.empty;

  UserModelEntity toEntity() {
    return UserModelEntity(
      id: id,
      name: name,
      email: email,
      imageUrl: imageUrl,
      username: username,
      password: password,
      document: document,
      phone: phone,
      city: city,
      gender: gender,
      birthDate: birthDate,
      sponsor: sponsor
    );
  }

  static UserModel fromEntity(UserModelEntity entity) {
    return UserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      imageUrl: entity.imageUrl,
      username: entity.username,
      password: entity.password,
      document: entity.document,
      phone: entity.phone,
      city: entity.city,
      gender: entity.gender,
      birthDate: entity.birthDate,
      sponsor: entity.sponsor
    );
  }
}