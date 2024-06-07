// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:tax_project/src/config/sizes/sizes.dart';
import 'package:tax_project/src/config/themes/theme.dart';
import 'package:tax_project/src/feature/register/model/form_model.dart';

// ignore: must_be_immutable
class CityDropdownWidget extends StatefulWidget {
  CityDropdownWidget({
    required this.formModel,
    this.onTap,
    super.key,
  });
  FormModel formModel;
  VoidCallback? onTap;

  @override
  State<CityDropdownWidget> createState() => _CityDropdownWidgetState();
}

class _CityDropdownWidgetState extends State<CityDropdownWidget> {
  // List of cities
  final List<String> cities = [
    'عمّان (العاصمة)',
    'إربد',
    'الزرقاء',
    'المفرق',
    'عجلون',
    'جرش',
    'مادبا',
    'البلقاء',
    'الكرك',
    'الطفيلة',
    'معان',
    'العقبة',
  ];

  // Variable to hold the selected city
  String? selectedCity;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(0.03 * context.screenWidth),
          ),
        ),
        child: DropdownButtonFormField<String>(
          value: selectedCity,
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
              selectedCity = newValue!;
            });
            if (widget.onTap != null) {
              widget.onTap!();
            }
          },
          items: cities.map<DropdownMenuItem<String>>((String city) {
            return DropdownMenuItem<String>(
              value: city,
              child: Text(city),
            );
          }).toList(),
        ),
      ),
    );
  }
}
