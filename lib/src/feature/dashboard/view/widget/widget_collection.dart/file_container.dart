import 'package:flutter/material.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/feature/dashboard/model/file_model.dart';

class FileContainer extends StatelessWidget {
  const FileContainer({super.key, required this.fileModel});
  final FileModel fileModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: fileModel.onTap,
      child: Container(
        width: context.screenWidth * 0.35,
        padding: const EdgeInsets.only(bottom: 20),
        child: Image.asset(fileModel.icon),
      ),
    );
  }
}
