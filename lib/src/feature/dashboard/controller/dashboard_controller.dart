import 'package:get/get.dart';
import 'package:tax_project/src/feature/dashboard/model/file_model.dart';
import 'package:tax_project/src/feature/periods/view/pages/periods_page.dart';

class DashboardControlller extends GetxController {
  List<FileModel> fileList = [
    FileModel(
        icon: "assets/img/mainInfo.png",
        onTap: () {
          Get.to(const PeriodsPage());
        }),
    FileModel(icon: "assets/img/addFile.png", onTap: () {}),
    FileModel(icon: "assets/img/updateFile.png", onTap: () {}),
    FileModel(icon: "assets/img/downloadFile.png", onTap: () {}),
  ];
}
