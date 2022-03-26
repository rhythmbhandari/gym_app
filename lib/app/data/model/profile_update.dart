import 'dart:io';

class ProfileUpdateRequest {
  String name;
  // File image;
  String address;

  ProfileUpdateRequest({this.name, this.address});
}

class ProfileGymRequest {
  String name;
  File image;
  String description;

  ProfileGymRequest({this.name, this.description, this.image});
}