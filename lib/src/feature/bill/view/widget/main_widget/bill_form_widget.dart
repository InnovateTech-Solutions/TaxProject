import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/database/db_controllers/bill_controller.dart';
import 'package:tax_project/src/config/database/db_controllers/category_controller.dart';
import 'package:tax_project/src/config/database/db_controllers/tax_form_controller.dart';
import 'package:tax_project/src/config/database/models/bill_model.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bill/controller/bill_controller.dart';
import 'package:tax_project/src/feature/bill/view/page/bill_page.dart';
import 'package:tax_project/src/feature/register/model/form_model.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/app_button.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/register_form.dart';

class BillFormWidget extends StatefulWidget {
  const BillFormWidget({
    super.key,
    required this.periods,
    required this.year,
    required this.img,
    required this.equation,
    required this.category,
    required this.categoryId,
    required this.taxPeriod,
  });
  final String taxPeriod;
  final int categoryId;
  final String periods;
  final String year;
  final String img;
  final String category;
  final double equation;

  @override
  State<BillFormWidget> createState() => _BillFormWidgetState();
}

class _BillFormWidgetState extends State<BillFormWidget> {
  final controller = Get.put(BbillController());
  void clearText() {
    controller.billImg.clear();
    controller.billDate.clear();
    controller.billNumber.clear();
    controller.billValue.clear();
  }

  final GlobalKey<FormState> formKey = GlobalKey<
      FormState>(); // Unique GlobalKey instance for each widget instance

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BbillController());
    final localBillController = Get.put(LocalBillController());
    final localTaxFormController = Get.put(TaxFormController());
    final localCategoryController = Get.put(LocalCategoryController());
    return Container(
      margin: const EdgeInsets.all(20),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppTheme.lightAppColors.iconcolor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.screenHeight * 0.05,
              ),
              const Text(
                "صورة الفاتورة",
                style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 20,
                ),
              ),
              FormWidget(
                formModel: FormModel(
                  controller: controller.billImg,
                  enableText: true,
                  hintText: widget.img,
                  invisible: false,
                  validator: null,
                  type: TextInputType.name,
                  inputFormat: null,
                ),
              ),
              SizedBox(
                height: context.screenHeight * .03,
              ),
              const Text(
                "قيمة الفاتورة",
                style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: context.screenHeight * .01,
              ),
              FormWidget(
                formModel: FormModel(
                  controller: controller.billValue,
                  enableText: false,
                  hintText: "قيمة الفاتورة",
                  invisible: false,
                  validator: (value) => controller.validation(value!),
                  type: TextInputType.number,
                  inputFormat: null,
                ),
              ),
              SizedBox(
                height: context.screenHeight * .03,
              ),
              const Text(
                "رقم الفاتورة",
                style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: context.screenHeight * .01,
              ),
              FormWidget(
                formModel: FormModel(
                  controller: controller.billNumber,
                  enableText: false,
                  hintText: "رقم الفاتورة",
                  invisible: false,
                  validator: null,
                  type: TextInputType.number,
                  inputFormat: null,
                ),
              ),
              SizedBox(
                height: context.screenHeight * .03,
              ),
              const Text(
                "تاريخ الفاتورة",
                style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: context.screenHeight * .01,
              ),
              Stack(
                children: [
                  FormWidget(
                    formModel: FormModel(
                      controller: controller.billDate,
                      enableText: true,
                      hintText: "تاريخ الفاتورة",
                      invisible: false,
                      validator: (value) => controller.validation(value!),
                      type: TextInputType.number,
                      inputFormat: [],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2015, 8),
                        lastDate: DateTime(2101),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: ThemeData.light().copyWith(
                              colorScheme: ColorScheme.light(
                                primary: AppTheme.lightAppColors
                                    .primary, // Header background color
                                onPrimary: Colors.white, // Header text color
                                surface: Colors.white, // Background color
                                onSurface: Colors.black, // Text color
                              ),
                              dialogBackgroundColor: Colors
                                  .white, // Background color of the dialog
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (picked != null) {
                        controller.billDate.text =
                            "${picked.day.toString()}/${picked.month.toString()}/${picked.year.toString()}";
                      }
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: context.screenHeight * .08,
                      width: context.screenWidth,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: context.screenHeight * .05,
              ),
              AppButton(
                  model: AppButtonModel(
                      title: "title",
                      onTap: () {
                        localBillController.getBills();
                      })),
              AppButton(
                  model: AppButtonModel(
                      title: "التالي",
                      onTap: () async {
                        print(widget.taxPeriod);
                        if (formKey.currentState!.validate()) {
                          try {
                            print("catgoooryyy iiidddd ${widget.categoryId}");
                            await localCategoryController.getCategoryByDetails(
                                localTaxFormController.taxID.value,
                                widget.categoryId,
                                widget.category);

                            localBillController.addBill(Bill(
                                categoryId: localCategoryController
                                    .categoryFormId.value,
                                image: controller.image.value?.path,
                                billNo: controller.billNumber.text,
                                billValue: double.parse(
                                  controller.billValue.text,
                                ),
                                taxValue: 122,
                                date: controller.billDate.text));
                          } catch (e) {
                            print(e);
                          }
                          // controller.addImg();
                          // controller.addBill(widget.category, widget.year);
                          // controller.totalBill();
                          Get.offAll(BillPage(
                            year: widget.year,
                            category: widget.category,
                            periods: widget.periods,
                            equation: widget.equation,
                            taxPeriod: '',
                            categoryId: widget.categoryId,
                          ));
                          // clearText();
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
