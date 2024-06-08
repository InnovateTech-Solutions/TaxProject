import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/database/db_controllers/bill_controller.dart';
import 'package:tax_project/src/config/database/db_controllers/category_controller.dart';
import 'package:tax_project/src/config/database/models/bill_model.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bill/controller/bill_controller.dart';
import 'package:tax_project/src/feature/bill/view/page/bill_img.dart';
import 'package:tax_project/src/feature/bill/view/widget/collection_widgets/bill_dialog.dart';
import 'package:tax_project/src/feature/dashboard/view/pages/dashboard_page.dart';
import 'package:tax_project/src/feature/register/view/widget/widget_collection/app_button.dart';

class BillWidget extends StatefulWidget {
  const BillWidget({
    super.key,
    required this.year,
    required this.category,
    required this.periods,
    required this.equation,
    required this.categoryId,
    required this.taxFormId,
    required this.taxPeriod,
  });
  final String taxPeriod;
  final int taxFormId;

  final int categoryId;
  final String year;
  final String category;
  final String periods;
  final double equation;

  @override
  State<BillWidget> createState() => _BillWidgetState();
}

class _BillWidgetState extends State<BillWidget> {
  final controller = Get.put(BbillController());
  final localBillController = Get.put(LocalBillController());
  final localCategoryController = Get.put(LocalCategoryController());
  RxList<Bill> bills = <Bill>[].obs;

  @override
  void initState() {
    super.initState();
    initializeBills();
  }

  Future<void> initializeBills() async {
    localBillController.bills.clear();
    await localCategoryController.getCategoryByDetails(
        widget.taxFormId, widget.categoryId);
    print("category from id : ${localCategoryController.categoryFormId.value}");
    await localBillController
        .getBillsByCategoryId(localCategoryController.categoryFormId.value);
    setState(() {
      bills = localBillController.bills;
    });
  }

  Future<void> deleteBill(int billId) async {
    await localBillController.deleteBill(billId);
    await initializeBills(); // Refresh the bills list after deletion
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
              onTap: () {},
              child: Text(
                  localCategoryController.categoryFormId.value.toString())),
          Container(
            width: context.screenWidth * .7,
            height: context.screenHeight * 0.06,
            decoration: BoxDecoration(
              color: AppTheme.lightAppColors.primary,
              borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Text(
                    "  المجموع ${controller.total.value.toString()} دينار",
                    style: TextStyle(
                      color: AppTheme.lightAppColors.background,
                      fontSize: 25,
                      fontFamily: 'Poppins-Regular',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: context.screenHeight * .03,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            width: context.screenWidth,
            height: bills.length < 6
                ? (context.screenHeight * .09 * bills.length)
                : context.screenHeight * .55,
            child: ListView.separated(
              itemCount: bills.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showBill(context, bills[index]);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: context.screenWidth * .7,
                    height: context.screenHeight * 0.08,
                    decoration: BoxDecoration(
                      color: AppTheme.lightAppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          bills[index].date.toString(),
                          style: TextStyle(
                            color: AppTheme.lightAppColors.background,
                            fontSize: 25,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                        Text(
                          "# ${bills[index].categoryId.toString()}",
                          style: TextStyle(
                            color: AppTheme.lightAppColors.background,
                            fontSize: 25,
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteBill(bills[index].id!),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: context.screenHeight * 0.01,
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(BillImgPage(
                periods: widget.periods,
                year: widget.year,
                equation: widget.equation,
                category: widget.category,
                categoryId: widget.categoryId,
                taxFormId: widget.taxFormId,
                taxPeriod: widget.taxPeriod,
              ));
            },
            child: Container(
              margin: EdgeInsets.only(right: 30),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Color(0xffA1BFE1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                Icons.add,
                color: AppTheme.lightAppColors.background,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: AppButton(
              model: AppButtonModel(
                title: "التالي",
                onTap: () {
                  Get.to(DashboardPage());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
