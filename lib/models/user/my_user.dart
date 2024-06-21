import 'my_user_entity.dart';

class MyUser {
  final String id;
  final String name;
  final String email;
  String? picture;
  final String username;
  final String password;
  final String document;
  final String phone;
  final String city;
  final String gender;
  final DateTime birthDate;
  final String sponsor;

  MyUser({
    required this.id,
    required this.name,
    required this.email,
    this.picture,
    required this.username,
    required this.password,
    required this.document,
    required this.phone,
    required this.city,
    required this.gender,
    required this.birthDate,
    required this.sponsor,
  });

  // Empty user which represents an unauthenticated user
  static final empty = MyUser(
    id: '',
    name: '',
    email: '',
    picture: '',
    username: '',
    password: '',
    document: '',
    phone: '',
    city: '',
    gender: '',
    birthDate: DateTime.now(),
    sponsor: '',
  );

  MyUser copyWith({
    String? id,
    String? name,
    String? email,
    String? picture,
    String? username,
    String? password,
    String? document,
    String? phone,
    String? city,
    String? gender,
    DateTime? birthDate,
    String? sponsor,
  }) {
    return MyUser(
      id: id ?? this.id, 
      name: name ?? this.name, 
      email: email ?? this.email,
      picture: picture ?? this.picture, 
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

  bool get isEmpty => this == MyUser.empty;

  bool get isNotEmpty => this != MyUser.empty;

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      name: name,
      email: email,
      picture: picture,
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

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      picture: entity.picture,
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

  List<Object?> get props => [
    id,
    name,
    email,
    picture,
    username,
    password,
    document,
    phone,
    city,
    gender,
    birthDate,
    sponsor
  ];
}