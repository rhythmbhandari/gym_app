import 'dart:io';

class ProfileUpdateRequest {
  String name;
  File image;
  String address;

  ProfileUpdateRequest({this.image, this.name, this.address});
}
