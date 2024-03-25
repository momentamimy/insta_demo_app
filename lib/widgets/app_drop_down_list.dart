import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo_app/core/screen_utils/values_manger.dart';
import 'package:insta_demo_app/core/theme/colors.dart';

class AppDropDownList extends StatelessWidget {
  final String hint;
  final String? selectedValue;
  final List<String> dropDownList;
  final FormFieldValidator<String>? validator;
  final Function(String?, int) onChange;
  final Widget? prefixIcon;

  const AppDropDownList({
    super.key,
    required this.hint,
    required this.selectedValue,
    required this.dropDownList,
    required this.onChange,
    this.prefixIcon, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        counterText: "",
        helperStyle: TextStyle(color: C.grayBlack),
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: C.secondaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        errorMaxLines: 4,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: C.lightGray),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: C.lightGray),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        labelText: hint,
        labelStyle:
        const TextStyle(color: C.lightGray, fontWeight: FontWeight.normal),
        contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p18),

      ),
      items: dropDownList
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: AppFontSize.s14,
                  ),
                ),
              ))
          .toList(),
      validator:validator,
      onChanged: (value) {
       onChange(value,dropDownList.indexWhere((element) => element == value));
       //Do something when selected item is changed.
      },
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        maxHeight: AppSize.s200,
        width: AppSize.s140,
        decoration:
            BoxDecoration(
              borderRadius: BorderRadius.circular(14),
            ),
        elevation: 8,
        //Null or Offset(0, 0) will open just under the button. You can edit as you want.
        scrollbarTheme: ScrollbarThemeData(
          radius: Radius.circular(AppSize.s40),
          thickness: MaterialStateProperty.all<double>(2),
          thumbVisibility:MaterialStateProperty.all<bool>(true)
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        height: AppSize.s40,
        padding: EdgeInsets.only(left: AppPadding.p14, right: AppPadding.p14),
      ),
    );
  }
}
