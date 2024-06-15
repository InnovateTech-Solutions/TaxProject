import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/database/db_controllers/category_controller.dart';
import 'package:tax_project/src/config/database/db_controllers/tax_form_controller.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/feature/bill/view/page/bill_page.dart';
import 'package:tax_project/src/feature/category/controller/category_controller.dart';
import 'package:tax_project/src/feature/category/view/widget/widget_collection/category_container.dart';

import '../../../../../config/themes/theme.dart';
import '../../../../periods/view/widget/text_widget/period_text.dart';

class ViewCategoeyWidget extends StatefulWidget {
  const ViewCategoeyWidget(
      {super.key,
      required this.periods,
      required this.year,
      required this.taxPeriod,
      required this.view});
  final String view;
  final String taxPeriod;
  final String periods;
  final String year;

  @override
  State<ViewCategoeyWidget> createState() => _ViewCategoeyWidgetState();
}

class _ViewCategoeyWidgetState extends State<ViewCategoeyWidget> {
  final controller = Get.put(CategoryController());
  final localCategoryController = Get.put(LocalCategoryController());
  final localTaxFormController = Get.put(TaxFormController());
  @override
  void initState() {
    getTaxForm();
    super.initState();
  }

  Future<void> getTaxForm() async {
    await localTaxFormController.getTaxFormsByYearAndTaxPeriod(
        widget.year, widget.taxPeriod);
    localCategoryController.categories.clear();

    localCategoryController
        .getCategoriesByTaxFormId(localTaxFormController.taxID.value);
  }

  @override
  Widget build(BuildContext context) {
    // Future<void> addCategory(index) async {
    //   print(controller.category[index].id);
    //   await localCategoryController.getCategoryByDetails(
    //     localTaxFormController.taxID.value,
    //     controller.category[index].id!,
    //   );
    //   final category = localCategoryController.categories;
    //   if (category.isEmpty) {
    //     print("its null");
    //     localCategoryController.addCategory(Category(
    //         taxFormId: localTaxFormController.taxID.value,
    //         title: controller.category[index].title,
    //         categoryId: controller.category[index].id));
    //   } else {
    //     print("its not null");
    //   }

    //   Get.to(BillImgPage(
    //     periods: widget.periods,
    //     year: widget.year,
    //     category: controller.category[index].title!,
    //     equation: 0,
    //     categoryId: controller.category[index].id!,
    //     taxFormId: localTaxFormController.taxID.value,
    //     taxPeriod: widget.taxPeriod,
    //   ));
    // }

    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(localCategoryController.categories.length.toString()),
            Text(widget.view),
            Row(
              children: [
                SizedBox(
                  width: context.screenWidth * 0.05,
                ),
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
            Row(
              children: [
                SizedBox(
                  width: context.screenWidth * 0.055,
                ),
                PeriodText.secText("اختر البيان الضريبي الذي تريد تعبئته"),
              ],
            ),
            SizedBox(
              height: context.screenHeight * 0.025,
            ),
            widget.view == "add"
                ? SizedBox(
                    width: context.screenWidth,
                    height: context.screenHeight * 0.77,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () async {
                              await localTaxFormController
                                  .getTaxFormsByYearAndTaxPeriod(
                                      widget.year, widget.taxPeriod);
                              if (controller.category[index].id == 1) {
                                // addCategory(index);
                              } else if (controller.category[index].id == 2 ||
                                  controller.category[index].id == 3 ||
                                  controller.category[index].id == 6) {
                                percentageDialog(
                                  context,
                                  widget.periods,
                                  widget.year,
                                  controller.category[index].title,
                                  controller.percentages,
                                  widget.taxPeriod,
                                  controller.category[index].id!,
                                );
                              } else {
                                // addCategory(index);
                              }
                            },
                            child: CategoryContainer(
                              model: controller.category[index],
                              taxPeriod: widget.taxPeriod,
                              categoryId: controller.category[index].id!,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: context.screenHeight * 0.03);
                        },
                        itemCount: controller.category.length),
                  )
                : SizedBox(
                    width: context.screenWidth,
                    height: context.screenHeight * 0.77,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.to(BillPage(
                                year: widget.year,
                                category: controller.category[index].title!,
                                periods: widget.periods,
                                equation: 0,
                                taxPeriod: widget.taxPeriod,
                                categoryId: controller.category[index].id!,
                                taxFormId: localTaxFormController.taxID.value,
                              ));
                            },
                            child: CategoryContainer(
                              model: localCategoryController.categories[index],
                              taxPeriod: widget.taxPeriod,
                              categoryId: localCategoryController
                                  .categories[index].categoryId!,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: context.screenHeight * 0.03);
                        },
                        itemCount: localCategoryController.categories.length),
                  ),
          ],
        ),
      ),
    );
  }
}
