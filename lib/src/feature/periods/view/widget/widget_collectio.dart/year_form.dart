import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tax_project/src/config/themes/theme.dart';

class YearForm extends StatefulWidget {
  const YearForm({required this.yearModel, Key? key}) : super(key: key);
  final YearFormModel yearModel;

  @override
  State<YearForm> createState() => _YearFormState();
}

class _YearFormState extends State<YearForm> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Center(
        child: Theme(
          data: Theme.of(context).copyWith(
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: Colors.grey[100],
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme.lightAppColors.formTextColor),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme.lightAppColors.formTextColor),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          child: TextFormField(
            style: const TextStyle(
              fontFamily: 'Poppins-Bold',
            ),
            cursorColor: Colors.grey[700],
            inputFormatters: widget.yearModel.inputFormat,
            readOnly: widget.yearModel.enableText,
            keyboardType: widget.yearModel.type,
            validator: widget.yearModel.validator,
            onTap: widget.yearModel.ontap,
            onChanged: widget.yearModel.onChange,
            controller: widget.yearModel.controller,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle:
                  TextStyle(color: AppTheme.lightAppColors.mainTextcolor),
              hintText: widget.yearModel.hintText,
            ),
          ),
        ),
      ),
    );
  }
}

class YearFormModel {
  TextEditingController? controller = TextEditingController();
  String hintText;
  bool enableText;
  VoidCallback ontap;
  TextInputType type;
  void Function(String?)? onChange;
  List<TextInputFormatter>? inputFormat;
  final String? Function(String?)? validator;

  YearFormModel({
    this.controller,
    required this.hintText,
    required this.type,
    required this.validator,
    required this.ontap,
    required this.enableText,
    required this.onChange,
    required this.inputFormat,
  });
}
