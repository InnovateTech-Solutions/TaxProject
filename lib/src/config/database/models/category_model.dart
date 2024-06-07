class Category {
  int? id;
  String? title;
  String? equation;
  String? taxPeriod;
  double? taxPercentage;
  int? taxFormId;
  int? categoryId; // New field

  Category({
    this.id,
    this.title,
    this.equation,
    this.taxPeriod,
    this.taxPercentage,
    this.taxFormId,
    this.categoryId, // New field
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'equation': equation,
      'taxPeriod': taxPeriod,
      'taxPercentage': taxPercentage,
      'taxFormId': taxFormId,
      'categoryId': categoryId, // New field
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      title: map['title'],
      equation: map['equation'],
      taxPeriod: map['taxPeriod'],
      taxPercentage: map['taxPercentage'],
      taxFormId: map['taxFormId'],
      categoryId: map['categoryId'], // New field
    );
  }
}
