import 'dart:io';

class TaxModel {
  String year;
  List<CategoryModel> category;
  String? startDate;
  String? endDate;
  TaxModel(
      {required this.year,
      required this.category,
      this.endDate,
      this.startDate});
}

class CategoryModel {
  String title;
  List<Bill>? bills;
  double? totalValue;
  double? taxValue;
  double? equation;
  bool? percentage;
  List<double>? percentageValue;

  CategoryModel(
      {required this.title,
      this.equation,
      this.percentageValue,
      this.percentage,
      this.taxValue,
      this.totalValue,
      this.bills});
}

class Bill {
  int id;
  File? img;
  int billNumber;
  int billValue;
  double? taxValue;
  String type;
  String year;

  String billDate;
  int? vendorTaxNumber;

  Bill({
    required this.id,
    required this.type,
    required this.img,
    required this.year,
    required this.billDate,
    this.taxValue = 0.0,
    required this.billNumber,
    required this.billValue,
  });
}
