class UserModelEntity {
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

  UserModelEntity({
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

  Map<String, Object?> toDocument() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
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

  static UserModelEntity fromDocument(Map<String, Object?> data) {
    return UserModelEntity(
      id: data['id'] as String,
      name: data['name'] as String,
      email: data['email'] as String?,
      imageUrl: data['imageUrl'] as String,
      username: data['username'] as String,
      password: data['password'] as String,
      document: data['document'] as String,
      phone: data['phone'] as String,
      city: data['city'] as String,
      gender: data['gender'] as String,
      birthDate: data['birthDate'] as DateTime,
      sponsor: data['sponsor'] as String,
    );
  }

  List<Object?> get props => [
        id,
        name,
        email,
        imageUrl,
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
    return '''UserModelEntity { id: $id, name: $name, email: $email, imageUrl: $imageUrl, username: $username, password: $password, document: $document, phone: $phone, city: $city, gender: $gender, birthDate: $birthDate, sponsor: $sponsor }''';
  }
}