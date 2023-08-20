// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_doctor_mobile/common/values/colors.dart';

class PhoneCodeDropDown<TItem> extends StatelessWidget {
  PhoneCodeDropDown({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onChanged,
    this.searchMatchFn,
  });

  final List<DropdownMenuItem<TItem>> items;
  TItem? selectedItems;
  void Function(TItem?)? onChanged;
  bool Function(DropdownMenuItem<TItem>, String)? searchMatchFn;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<TItem>(
        isExpanded: true,
        hint: Text(
          'Select Item',
          style: TextStyle(
            fontSize: 14,
            color: Theme.of(context).hintColor,
          ),
        ),
        items: items,
        value: selectedItems,
        onChanged: onChanged,
        buttonStyleData: const ButtonStyleData(
          height: 40,
          width: 70,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: AppColors.primaryBackground,
          ),
          offset: const Offset(-20, 0),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
        dropdownSearchData: DropdownSearchData(
          searchController: textEditingController,
          searchInnerWidgetHeight: 50,
          searchInnerWidget: Container(
            height: 50,
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 4,
              right: 8,
              left: 8,
            ),
            child: TextField(
              expands: true,
              maxLines: null,
              controller: textEditingController,
              style: const TextStyle(
                color: AppColors.primaryText,
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                hintText: 'Search',
                hintStyle: const TextStyle(
                  fontSize: 12,
                  color: AppColors.primaryText,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: AppColors.primaryText,
                    width: 1.w,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: AppColors.primaryText,
                    width: 1.w,
                  ),
                ),
              ),
            ),
          ),
          searchMatchFn: searchMatchFn,
        ),
        //This to clear the search value when you close the menu
        onMenuStateChange: (isOpen) {
          if (!isOpen) {
            textEditingController.clear();
          }
        },
      ),
    );
  }
}
