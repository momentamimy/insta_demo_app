import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:insta_demo_app/core/helper/utils.dart';
import 'package:insta_demo_app/core/screen_utils/values_manger.dart';
import 'package:insta_demo_app/core/theme/colors.dart';
import 'package:insta_demo_app/widgets/auth_text_field_widget.dart';

class DatePickerTextField extends StatelessWidget {
  final String hintText;
  final Function(String) onDateChanged;
  final DateTime? selectedDate;
  final DateTime? startDate;
  final DateTime? lastDate;
  final IconData? prefixIcon;
  final FormFieldValidator<String>? validate;

  const DatePickerTextField(
      {super.key,
      required this.hintText,
      required this.onDateChanged,
      this.selectedDate,
      this.startDate,
      this.lastDate,
      this.validate, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return AuthTextFieldWidget(
      controller: controller,
      prefix: Icon(prefixIcon, color: C.secondaryColor),
      hintText: hintText,
      focusNode: AlwaysDisabledFocusNode(),
      validate: validate,
      onTap: () async {
        final res = await showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          context: context,
          builder: (context) => _SelectDateBottomSheet(
              hintText: hintText,
              selectedDate: controller.text.isNotEmpty
                  ? Utils.getDateTime(controller.text)
                  : selectedDate,
              startDate: startDate,
              lastDate: lastDate),
        );
        if (res != null) {
          controller.text = Utils.getStringDate(res);
          onDateChanged(controller.text);
        }
      },
    );
  }
}

class _SelectDateBottomSheet extends StatelessWidget {
  final String hintText;
  final DateTime? selectedDate;
  final DateTime? startDate;
  final DateTime? lastDate;

  const _SelectDateBottomSheet(
      {required this.hintText,
      required this.selectedDate,
      required this.startDate,
      required this.lastDate});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = this.selectedDate ?? DateTime.now();
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(hintText),
          SizedBox(
            width: AppRatio.w8,
            height: AppRatio.h25,
            child: DatePickerWidget(
              looping: false,
              initialDate: selectedDate,
              dateFormat: Utils.getDateFormat,
              locale: DatePicker.localeFromString("en"),
              onChange: (DateTime newDate, _) => selectedDate = newDate,
              pickerTheme: const DateTimePickerTheme(
                itemTextStyle: TextStyle(color: Colors.black, fontSize: 19),
                dividerColor: C.secondaryColor,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text(tr("done")),
                onPressed: () {
                  context.pop(selectedDate);
                },
              ),
              ElevatedButton(
                  child: Text(tr("back")),
                  onPressed: () {
                    context.pop();
                  }),
            ],
          )
        ],
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
