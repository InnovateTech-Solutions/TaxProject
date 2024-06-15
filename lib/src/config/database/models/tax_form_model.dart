class TaxForm {
  int? id;
  String? year;
  String? taxPeriod;
  int? period; // New field
  String? field14;
  String? field15;
  bool? field16;
  bool? field17;
  String? field18;
  String? field19;
  int? userId;

  TaxForm({
    this.id,
    this.year,
    this.taxPeriod,
    this.period, // New field
    this.field14,
    this.field15,
    this.field16,
    this.field17,
    this.field18,
    this.field19,
    this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'year': year,
      'taxPeriod': taxPeriod,
      'period': period, // New field
      'field14': field14,
      'field15': field15,
      'field16': field16,
      'field17': field17,
      'field18': field18,
      'field19': field19,
      'userId': userId,
    };
  }

  factory TaxForm.fromMap(Map<String, dynamic> map) {
    return TaxForm(
      id: map['id'],
      year: map['year'],
      taxPeriod: map['taxPeriod'],
      period: map['period'], // New field
      field14: map['field14'],
      field15: map['field15'],
      field16: map['field16'],
      field17: map['field17'],
      field18: map['field18'],
      field19: map['field19'],
      userId: map['userId'],
    );
  }
}
