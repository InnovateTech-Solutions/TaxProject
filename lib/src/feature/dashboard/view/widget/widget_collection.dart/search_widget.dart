import 'package:flutter/material.dart';
import 'package:tax_project/src/config/themes/theme.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({required this.search, Key? key}) : super(key: key);
  final SearchFormEntitiy search;

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
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
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
          child: TextFormField(
            style: const TextStyle(
              fontFamily: 'Poppins-Bold',
            ),
            cursorColor: Colors.grey[700],
            readOnly: widget.search.enableText,
            keyboardType: widget.search.type,
            onTap: widget.search.ontap,
            onChanged: widget.search.onChange,
            controller: widget.search.searchController,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              floatingLabelStyle:
                  TextStyle(color: AppTheme.lightAppColors.mainTextcolor),
              suffixIcon: Icon(
                Icons.search,
                color: AppTheme.lightAppColors.iconcolor,
              ),
              hintText: widget.search.hintText,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchFormEntitiy {
  TextEditingController? searchController = TextEditingController();
  String hintText;
  bool enableText;
  VoidCallback ontap;
  TextInputType type;
  void Function(String?)? onChange;

  SearchFormEntitiy({
    this.searchController,
    required this.hintText,
    required this.type,
    required this.ontap,
    required this.enableText,
    required this.onChange,
  });
}
