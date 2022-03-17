class Gym {
  Gym({
    this.id,
    this.companyName,
    this.description,
    this.image,
    this.qrcode,
    this.location,
    this.locationMap,
  });

  int id;
  dynamic companyName;
  dynamic description;
  dynamic image;
  String qrcode;
  dynamic location;
  dynamic locationMap;

  factory Gym.fromJson(Map<String, dynamic> json) => Gym(
    id: json["id"] == null ? null : json["id"],
    companyName: json["company_name"],
    description: json["description"],
    image: json["image"],
    qrcode: json["qrcode"] == null ? null : json["qrcode"],
    location: json["location"],
    locationMap: json["location_map"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "company_name": companyName,
    "description": description,
    "image": image,
    "qrcode": qrcode == null ? null : qrcode,
    "location": location,
    "location_map": locationMap,
  };
}
