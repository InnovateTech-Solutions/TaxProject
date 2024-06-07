class Category {
  int? id;
  String? equation;
  String? taxPeriod;
  double? taxPercentage;
  int? taxFormId;

  Category({
    this.id,
    this.equation,
    this.taxPeriod,
    this.taxPercentage,
    this.taxFormId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'equation': equation,
      'taxPeriod': taxPeriod,
      'taxPercentage': taxPercentage,
      'taxFormId': taxFormId,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      equation: map['equation'],
      taxPeriod: map['taxPeriod'],
      taxPercentage: map['taxPercentage'],
      taxFormId: map['taxFormId'],
    );
  }
}
