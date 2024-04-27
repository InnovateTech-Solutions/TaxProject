import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/bill/controller/bill_controller.dart';
import 'package:tax_project/src/feature/bill/view/page/bill_img.dart';

class BillWidget extends StatelessWidget {
  const BillWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BillController());
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth * .7,
            height: context.screenHeight * 0.06,
            decoration: BoxDecoration(
                color: AppTheme.lightAppColors.primary,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(12))),
            child: GestureDetector(
              onTap: () {
                Get.to(BillImgPage(
                    periods: "periods", year: "year", category: "category"));
              },
              child: Row(
                children: [
                  Text(
                    "  المجموع ${controller.total.value.toString()} دينار",
                    style: TextStyle(
                        color: AppTheme.lightAppColors.background,
                        fontSize: 25,
                        fontFamily: 'Poppins-Regular'),
                  )
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
            height: context.screenHeight * .5,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    width: context.screenWidth * .7,
                    height: context.screenHeight * 0.08,
                    decoration: BoxDecoration(
                        color: AppTheme.lightAppColors.primary,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          controller.bills[index].billNumber.toString(),
                          style: TextStyle(
                              color: AppTheme.lightAppColors.background,
                              fontSize: 25,
                              fontFamily: 'Poppins-Regular'),
                        ),
                        Text(
                          controller.bills[index].billValue.toString(),
                          style: TextStyle(
                              color: AppTheme.lightAppColors.background,
                              fontSize: 25,
                              fontFamily: 'Poppins-Regular'),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: context.screenHeight * .01,
                  );
                },
                itemCount: controller.bills.length),
          ),
        ],
      ),
    );
  }
}
