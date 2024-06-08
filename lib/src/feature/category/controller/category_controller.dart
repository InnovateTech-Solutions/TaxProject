import 'package:get/get.dart';
import 'package:tax_project/src/config/database/models/category_model.dart';

class CategoryController extends GetxController {
  List<double> percentages = [16.0, 10.0, 4.0, 0.0];

  List<Category> category = [
    Category(
      id: 1,
      title: "الرصيد المدور من الفترة السابقة",
    ),
    Category(
      id: 2,
      title: "المشتريات المحلية الخاضعة للضريبة بنسبة",
    ),
    Category(
      id: 3,
      title: "المستوردات الخاضعة للضريبة بنسبة",
    ),
    Category(
      id: 4,
      title: "المستوردات مؤجلة توريد الضريبة",
    ),
    Category(
      id: 5,
      title: 'لمشتريات والمستوردات المعفاة',
    ),
    Category(
      id: 6,
      title: "المبيعات المحلية الخاضعة لنسبة ",
    ),
    Category(
      id: 7,
      title: "المبيعات المحلية الخاضعة لنسبة صفر",
    ),
    Category(
      id: 8,
      title: "المبيعات المصدرة",
    ),
    Category(
      id: 9,
      title: "لمبيعات غير الخاضعة للضريبة",
    ),
    Category(
      id: 10,
      title: "المبيعات المحلية المعفاة",
    ),
    Category(
      id: 11,
      title: "ضريبة غير قابلة للخصم ( تخص مبيعات معفاة )",
    ),
    Category(
      id: 12,
      title: "حركة تعديل لصالح المسجل",
    ),
    Category(
      id: 14,
      title: "حركة تعديل لصالح الدائرة",
    ),
  ];
}
