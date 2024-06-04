import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/dashboard/view/widget/widget_collection.dart/search_widget.dart';

class SearchPgae extends StatelessWidget {
  const SearchPgae({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          height: context.screenHeight,
          width: context.screenWidth,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: context.screenWidth * 0.7,
                    height: context.screenHeight * 0.1,
                    child: SearchWidget(
                        search: SearchFormEntitiy(
                            hintText: "ابحث",
                            type: TextInputType.name,
                            ontap: () {},
                            enableText: false,
                            onChange: null)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "الغاء",
                      style: TextStyle(
                          color: AppTheme.lightAppColors.primary, fontSize: 20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
