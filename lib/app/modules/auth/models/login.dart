import 'package:flutter/material.dart';

class Login {
  Login({
    @required this.email,
    @required this.password,
  });

  String email;
  String password;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}
