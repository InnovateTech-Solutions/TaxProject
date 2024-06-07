class Bill {
  int? id;
  String? image;
  String? billNo;
  double? billValue;
  double? taxValue;
  String? date;
  int? categoryId;

  Bill({
    this.id,
    this.image,
    this.billNo,
    this.billValue,
    this.taxValue,
    this.date,
    this.categoryId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'billNo': billNo,
      'billValue': billValue,
      'taxValue': taxValue,
      'date': date,
      'categoryId': categoryId,
    };
  }

  factory Bill.fromMap(Map<String, dynamic> map) {
    return Bill(
      id: map['id'],
      image: map['image'],
      billNo: map['billNo'],
      billValue: map['billValue'],
      taxValue: map['taxValue'],
      date: map['date'],
      categoryId: map['categoryId'],
    );
  }
}
