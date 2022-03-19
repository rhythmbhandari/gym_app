class Subscribed {
  Subscribed({
    this.id,
    this.gym,
    this.customer,
  });

  int id;
  Gym gym;
  Customer customer;

  factory Subscribed.fromJson(Map<String, dynamic> json) => Subscribed(
    id: json["id"] == null ? null : json["id"],
    gym: json["gym"] == null ? null : Gym.fromJson(json["gym"]),
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "gym": gym == null ? null : gym.toJson(),
    "customer": customer == null ? null : customer.toJson(),
  };
}

class Customer {
  Customer({
    this.id,
    this.subscriptionDetails,
    this.description,
    this.image,
    this.totalCheckIns,
    this.remainingCheckIns,
    this.user,
    this.subscription,
  });

  int id;
  SubscriptionDetails subscriptionDetails;
  String description;
  dynamic image;
  int totalCheckIns;
  int remainingCheckIns;
  int user;
  int subscription;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    id: json["id"] == null ? null : json["id"],
    subscriptionDetails: json["subscription_details"] == null ? null : SubscriptionDetails.fromJson(json["subscription_details"]),
    description: json["description"] == null ? null : json["description"],
    image: json["image"],
    totalCheckIns: json["total_check_ins"] == null ? null : json["total_check_ins"],
    remainingCheckIns: json["remaining_check_ins"] == null ? null : json["remaining_check_ins"],
    user: json["user"] == null ? null : json["user"],
    subscription: json["subscription"] == null ? null : json["subscription"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "subscription_details": subscriptionDetails == null ? null : subscriptionDetails.toJson(),
    "description": description == null ? null : description,
    "image": image,
    "total_check_ins": totalCheckIns == null ? null : totalCheckIns,
    "remaining_check_ins": remainingCheckIns == null ? null : remainingCheckIns,
    "user": user == null ? null : user,
    "subscription": subscription == null ? null : subscription,
  };
}

class SubscriptionDetails {
  SubscriptionDetails({
    this.id,
    this.name,
    this.description,
    this.validFor,
    this.image,
    this.priceCurrency,
    this.price,
    this.perDayPriceCurrency,
    this.perDayPrice,
  });

  int id;
  String name;
  String description;
  int validFor;
  String image;
  String priceCurrency;
  String price;
  String perDayPriceCurrency;
  String perDayPrice;

  factory SubscriptionDetails.fromJson(Map<String, dynamic> json) => SubscriptionDetails(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    description: json["description"] == null ? null : json["description"],
    validFor: json["valid_for"] == null ? null : json["valid_for"],
    image: json["image"] == null ? null : json["image"],
    priceCurrency: json["price_currency"] == null ? null : json["price_currency"],
    price: json["price"] == null ? null : json["price"],
    perDayPriceCurrency: json["per_day_price_currency"] == null ? null : json["per_day_price_currency"],
    perDayPrice: json["per_day_price"] == null ? null : json["per_day_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "description": description == null ? null : description,
    "valid_for": validFor == null ? null : validFor,
    "image": image == null ? null : image,
    "price_currency": priceCurrency == null ? null : priceCurrency,
    "price": price == null ? null : price,
    "per_day_price_currency": perDayPriceCurrency == null ? null : perDayPriceCurrency,
    "per_day_price": perDayPrice == null ? null : perDayPrice,
  };
}

class Gym {
  Gym({
    this.id,
    this.addressDetail,
    this.companyName,
    this.description,
    this.image,
    this.qrcode,
    this.totalEarningCurrency,
    this.totalEarning,
    this.user,
    this.location,
  });

  int id;
  AddressDetail addressDetail;
  String companyName;
  String description;
  String image;
  String qrcode;
  String totalEarningCurrency;
  String totalEarning;
  int user;
  int location;

  factory Gym.fromJson(Map<String, dynamic> json) => Gym(
    id: json["id"] == null ? null : json["id"],
    addressDetail: json["address_detail"] == null ? null : AddressDetail.fromJson(json["address_detail"]),
    companyName: json["company_name"] == null ? null : json["company_name"],
    description: json["description"] == null ? null : json["description"],
    image: json["image"] == null ? null : json["image"],
    qrcode: json["qrcode"] == null ? null : json["qrcode"],
    totalEarningCurrency: json["total_earning_currency"] == null ? null : json["total_earning_currency"],
    totalEarning: json["total_earning"] == null ? null : json["total_earning"],
    user: json["user"] == null ? null : json["user"],
    location: json["location"] == null ? null : json["location"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "address_detail": addressDetail == null ? null : addressDetail.toJson(),
    "company_name": companyName == null ? null : companyName,
    "description": description == null ? null : description,
    "image": image == null ? null : image,
    "qrcode": qrcode == null ? null : qrcode,
    "total_earning_currency": totalEarningCurrency == null ? null : totalEarningCurrency,
    "total_earning": totalEarning == null ? null : totalEarning,
    "user": user == null ? null : user,
    "location": location == null ? null : location,
  };
}

class AddressDetail {
  AddressDetail({
    this.id,
    this.address,
    this.district,
    this.zone,
    this.municipality,
    this.street,
    this.province,
    this.localBodyName,
    this.locality,
    this.latitude,
    this.longitude,
  });

  int id;
  String address;
  String district;
  String zone;
  String municipality;
  String street;
  String province;
  String localBodyName;
  String locality;
  double latitude;
  double longitude;

  factory AddressDetail.fromJson(Map<String, dynamic> json) => AddressDetail(
    id: json["id"] == null ? null : json["id"],
    address: json["address"] == null ? null : json["address"],
    district: json["district"] == null ? null : json["district"],
    zone: json["zone"] == null ? null : json["zone"],
    municipality: json["municipality"] == null ? null : json["municipality"],
    street: json["street"] == null ? null : json["street"],
    province: json["province"] == null ? null : json["province"],
    localBodyName: json["local_body_name"] == null ? null : json["local_body_name"],
    locality: json["locality"] == null ? null : json["locality"],
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "address": address == null ? null : address,
    "district": district == null ? null : district,
    "zone": zone == null ? null : zone,
    "municipality": municipality == null ? null : municipality,
    "street": street == null ? null : street,
    "province": province == null ? null : province,
    "local_body_name": localBodyName == null ? null : localBodyName,
    "locality": locality == null ? null : locality,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
  };
}
