class User {
  int? id;
  String? name;
  String? phone;
  String? telephone;
  String? email;
  String? taxNumber;
  String? country;
  String? province;

  User({
    this.id,
    this.name,
    this.phone,
    this.telephone,
    this.email,
    this.taxNumber,
    this.country,
    this.province,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'telephone': telephone,
      'email': email,
      'taxNumber': taxNumber,
      'country': country,
      'province': province,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      telephone: map['telephone'],
      email: map['email'],
      taxNumber: map['taxNumber'],
      country: map['country'],
      province: map['province'],
    );
  }
}
