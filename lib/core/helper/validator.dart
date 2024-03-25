import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:insta_demo_app/core/helper/utils.dart';

class Validator {
  static String? nameValidation(String? value) {
    if (value!.isNotEmpty) {
      if (value.characters.every((element) => element == " ")) {
        return tr("msg_name_should_not_spaces_only");
      } else if (value.characters.first == " ") {
        return tr("msg_name_should_not_start_space");
      } else if (!Utils.validateNameREGX(value)) {
        return tr("msg_name_validation");
      } else {
        return null;
      }
    } else {
      return tr("please", args: [tr("enter_name")]);
    }
  }

  static String? phoneValidation(String? value) {
    if (value?.isEmpty??true) {
      return tr("please", args: [tr("enter_phone")]);
    } else if (!Utils.validatePhoneEgyptREGX(value!)) {
      return "please".tr(args: [tr("valid_phone")]);
    } else {
      return null;
    }
  }


  static casePropertiesDefaultValidation(String? value,String hint){
    if (value?.isEmpty??true) {
      return tr("please_enter", args: [hint]);
    }else if (value!.characters.first == " ") {
      return tr("msg_name_should_not_start_space");
    } else {
      return null;
    }
  }


  /*static String? caseNumberValidation(String? value) {
    if (value?.isEmpty??true) {
      return tr("please", args: [tr("enter_case_number")]);
    } else {
      return null;
    }
  }*/
/*
  static String? caseYearValidation(String? value) {
    if (value?.isEmpty??true) {
      return tr("please", args: [tr("enter_case_year")]);
    } else {
      return null;
    }
  }*/
}
