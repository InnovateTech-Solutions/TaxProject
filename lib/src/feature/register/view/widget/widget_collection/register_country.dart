import 'package:flutter/material.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/register/model/form_model.dart';

// ignore: must_be_immutable
class CountryDropdownWidget extends StatefulWidget {
  CountryDropdownWidget({
    required this.formModel,
    this.onTap,
    super.key,
  });
  FormModel formModel;
  VoidCallback? onTap;

  @override
  State<CountryDropdownWidget> createState() => _CountryDropdownWidgetState();
}

class _CountryDropdownWidgetState extends State<CountryDropdownWidget> {
  // List of countries
  final List<String> countries = [
    'المملكة العربية السعودية',
    'الإمارات العربية المتحدة',
    'قطر',
    'البحرين',
    'عمان',
    'الكويت',
    'مصر',
    'الأردن',
    'لبنان',
    'العراق',
    'سوريا',
    'اليمن',
    'المغرب',
    'تونس',
    'الجزائر',
    'ليبيا',
    'السودان',
  ];

  // Variable to hold the selected country
  String? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(0.01 * context.screenWidth),
          ),
        ),
        child: DropdownButtonFormField<String>(
          value: selectedCountry,
          hint: Text(widget.formModel.hintText),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppTheme.lightAppColors.background,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(0.03 * context.screenWidth),
              ),
            ),
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(0.03 * context.screenWidth),
              ),
            ),
            hintStyle: TextStyle(
              fontFamily: 'cairo-Regular',
              color: Colors.black.withOpacity(0.5),
              fontSize: 17,
            ),
          ),
          style: TextStyle(
            color: AppTheme.lightAppColors.primary,
          ),
          onChanged: (String? newValue) {
            setState(() {
              selectedCountry = newValue!;
            });
            if (widget.onTap != null) {
              widget.onTap!();
            }
          },
          items: countries.map<DropdownMenuItem<String>>((String country) {
            return DropdownMenuItem<String>(
              value: country,
              child: Text(country),
            );
          }).toList(),
        ),
      ),
    );
  }
}
