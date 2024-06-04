import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/feature/dashboard/controller/dashboard_controller.dart';
import 'package:tax_project/src/feature/dashboard/view/widget/widget_collection.dart/file_container.dart';
import 'package:tax_project/src/feature/dashboard/view/widget/widget_collection.dart/search_widget.dart';
import 'package:tax_project/src/feature/search/view/search_page.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardControlller());
    return SizedBox(
      height: context.screenHeight,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: context.screenHeight * 0.28,
                width: context.screenWidth * 0.38,
                child: Image.asset(
                  "assets/img/iconText.png",
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.28,
                width: context.screenWidth * 0.28,
                child: Image.asset(
                  "assets/img/icon.jpeg",
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: context.screenWidth,
              height: context.screenHeight * 0.64,
              decoration: const BoxDecoration(
                  color: Color(0xffDAE3EE),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(50))),
              child: Column(
                children: [
                  SizedBox(
                    width: context.screenWidth * 0.8,
                    height: context.screenHeight * 0.15,
                    child: SearchWidget(
                        search: SearchFormEntitiy(
                            hintText: "البحث",
                            type: TextInputType.text,
                            ontap: () {
                              Get.to(SearchPgae(),
                                  transition: Transition.fade,
                                  duration: const Duration(milliseconds: 500));
                            },
                            enableText: true,
                            onChange: null)),
                  ),
                  SizedBox(
                    width: context.screenWidth,
                    height: context.screenHeight * 0.49,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: context.screenHeight * 0.2,
                        crossAxisCount: 2,
                      ),
                      itemCount: controller.fileList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FileContainer(
                            fileModel: controller.fileList[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
