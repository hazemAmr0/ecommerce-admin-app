import 'package:admin_app/constants/Category_List.dart';
import 'package:flutter/material.dart';

class CategoryDropdown extends StatefulWidget {
  CategoryDropdown({
    super.key,
    required this.categoryValue,
    required this.onChanged,
  });

  String? categoryValue;
  final ValueChanged<String?> onChanged;

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonHideUnderline(
        
        child: DropdownButton<String>(
          hint: Text(widget.categoryValue ?? "Select Category"),
          value: widget.categoryValue,
          items: AppConst.categoriesDropDownList,
          onChanged: (String? value) {
            setState(() {
              widget.categoryValue = value;
              widget.onChanged(value);
            });
          },
        ),
      ),
    );
  }
}
