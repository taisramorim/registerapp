import 'package:equatable/equatable.dart';

class MyUserEntity extends Equatable{

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

  MyUserEntity({
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

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'picture': picture,
      'username': username,
      'password': password,
      'document': document,
      'phone': phone,
      'city': city,
      'gender': gender,
      'birthDate': birthDate,
      'sponsor': sponsor,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      id: doc['id'] as String,
      name: doc['name'] as String,
      email: doc['email'] as String,
      picture: doc['picture'] as String?,
      username: doc['username'] as String,
      password: doc['password'] as String,
      document: doc['document'] as String,
      phone: doc['phone'] as String,
      city: doc['city'] as String,
      gender: doc['gender'] as String,
      birthDate: doc['birthDate'] as DateTime,
      sponsor: doc['sponsor'] as String,
    );
  }

  @override
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

  @override
  String toString(){
    return '''MyUserEntity { 
      id: $id, 
      name: $name, 
      email: $email, 
      picture: $picture, 
      username: $username,
      password: $password, 
      document: $document, 
      phone: $phone, 
      city: $city, 
      gender: $gender, 
      birthDate: $birthDate, 
      sponsor: $sponsor 
    }''';
  }
}