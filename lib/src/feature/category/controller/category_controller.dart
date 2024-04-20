import 'package:get/get.dart';
import 'package:tax_project/src/feature/category/model/category_model.dart';

class CategoryController extends GetxController {
  List<int> percentages = [16, 10, 4];
  List<CategoryModel> category = [
    CategoryModel(title: "الرصيد المدور من الفترة السابقة", percentage: false),
    CategoryModel(
        title: "المشتريات المحلية الخاضعة للضريبة بنسبة", percentage: true),
    CategoryModel(title: "المستوردات الخاضعة للضريبة بنسبة", percentage: false),
    CategoryModel(title: "المستوردات مؤجلة توريد الضريبة", percentage: false),
    CategoryModel(title: 'لمشتريات والمستوردات المعفاة', percentage: false),
    CategoryModel(title: "المبيعات المحلية الخاضعة لنسبة ", percentage: false),
    CategoryModel(
        title: "المبيعات المحلية الخاضعة لنسبة صفر", percentage: false),
    CategoryModel(title: "المبيعات المصدرة", percentage: false),
    CategoryModel(title: "لمبيعات غير الخاضعة للضريبة", percentage: false),
    CategoryModel(title: "المبيعات المحلية المعفاة", percentage: false),
    CategoryModel(
        title: "ضريبة غير قابلة للخصم ( تخص مبيعات معفاة )", percentage: false),
    CategoryModel(title: "حركة تعديل لصالح المسجل", percentage: false),
    CategoryModel(title: "حركة تعديل لصالح الدائرة", percentage: false),
  ];
}
