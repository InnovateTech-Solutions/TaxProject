class CategoryModel {
  String title;
  List<Bill>? bills;
  double? totalValue;
  double? taxValue;
  double? equation;
  bool percentage;
  List<double>? percentageValue;

  CategoryModel(
      {required this.title,
      this.equation,
      this.percentageValue,
      required this.percentage,
      this.taxValue,
      this.totalValue,
      this.bills});
}

class Bill {
  int id;
  String img;
  int billNumber;
  double billValue;
  int? vendorTaxNumber;

  Bill({
    required this.id,
    required this.img,
    required this.billNumber,
    required this.billValue,
  });
}
