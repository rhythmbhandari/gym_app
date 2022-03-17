class User {
  User({
    this.id,
    this.email,
    this.name,
    this.address,
    this.gender,
    this.phone,
  });

  int id;
  String email;
  String name;
  String address;
  String gender;
  String phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    name: json["name"] == null ? null : json["name"],
    address: json["address"] == null ? null : json["address"],
    gender: json["gender"] == null ? null : json["gender"],
    phone: json["phone"] == null ? null : json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "name": name == null ? null : name,
    "address": address == null ? null : address,
    "gender": gender == null ? null : gender,
    "phone": phone == null ? null : phone,
  };
}
