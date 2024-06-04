class Other {
  int? id;
  String? image;
  double? value;
  int? taxFormId;

  Other({
    this.id,
    this.image,
    this.value,
    this.taxFormId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'value': value,
      'taxFormId': taxFormId,
    };
  }

  factory Other.fromMap(Map<String, dynamic> map) {
    return Other(
      id: map['id'],
      image: map['image'],
      value: map['value'],
      taxFormId: map['taxFormId'],
    );
  }
}
