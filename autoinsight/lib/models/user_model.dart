import 'dart:convert';

class User {
  User(
    {
      required this.email, 
      required this.password, 
      required this.name, 
      required this.phone, 
      required this.address, 
      required this.carName, 
      required this.carYear, 
      required this.licencePlate
    }
  );

  final String email, password, name, phone, address, carName, carYear, licencePlate;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'address': address,
      'carName': carName,
      'carYear': carYear,
      'licencePlate': licencePlate
    };
  }

  factory User.fromMap(Map<String, dynamic> iMap) {
    return User(
      email: iMap['email'],
      password: iMap['password'],
      name: iMap['name'],
      phone: iMap['phone'],
      address: iMap['address'],
      carName: iMap['carName'],
      carYear: iMap['carYear'],
      licencePlate: iMap['licencePlate']
    );
  }

  String toJson() => json.encode(toMap());

  factory User.from(String source) =>
      User.fromMap(json.decode(source));
}