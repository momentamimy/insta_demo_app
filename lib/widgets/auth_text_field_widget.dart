import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insta_demo_app/core/screen_utils/values_manger.dart';
import 'package:insta_demo_app/core/theme/colors.dart';

class AuthTextFieldWidget extends StatefulWidget {
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText, errorText;
  final TextInputType? keyboardType;
  final bool obscureText, enabled, readOnly, showBorder, autoFocus;
  final TextInputAction? textInputAction;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final void Function(String)? onSubmitted;
  final Widget? prefix;
  final Widget? suffix;
  final FormFieldValidator<String>? validate;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final int? maxLength;
  final bool enableInteractiveSelection;

  const AuthTextFieldWidget({
    required this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.onChange,
    this.onTap,
    this.onSubmitted,
    this.controller,
    this.focusNode,
    this.prefix,
    this.errorText,
    this.textInputAction,
    this.enabled = true,
    this.readOnly = false,
    this.showBorder = true,
    this.validate,
    this.autoFocus = false,
    this.maxLength,
    this.enableInteractiveSelection = true,
    this.suffix,
    this.inputFormatters,
  });

  @override
  State<AuthTextFieldWidget> createState() => _AuthTextFieldWidgetState();
}

class _AuthTextFieldWidgetState extends State<AuthTextFieldWidget> {
  late bool _shouldShowAsPasswordText;
  IconData _passwordIcon = Icons.visibility;

  @override
  void initState() {
    super.initState();
    // Initially password is obscure
    _shouldShowAsPasswordText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      cursorColor: C.secondaryColor,
      onTap: widget.onTap,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      maxLength: widget.maxLength ?? 50,
      inputFormatters: widget.inputFormatters,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      style: TextStyle(
          height: 2,
          color: C.grayBlack,
          fontSize: AppFontSize.s15,
          fontWeight: FontWeight.w700),
      keyboardType: widget.keyboardType,
      obscureText: _shouldShowAsPasswordText,
      //check if input is enabled because if not we can't ues auto fill
      autofillHints:
          widget.keyboardType == TextInputType.emailAddress && widget.enabled
              ? [AutofillHints.email]
              : null,
      decoration: InputDecoration(
        counterText: "",
        helperStyle: const TextStyle(color: C.grayBlack),
        prefixIcon: widget.prefix,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: C.secondaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        errorMaxLines: 4,
        suffixIcon: widget.suffix ??
            (widget.obscureText
                ? IconButton(
                    icon: Icon(
                      _passwordIcon,
                      color: C.lightGray,
                    ),
                    onPressed: _toggleVisibilityIcon,
                  )
                : null),
        enabledBorder: OutlineInputBorder(
          borderSide: widget.showBorder
              ? const BorderSide(color: C.lightGray)
              : BorderSide.none,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: widget.showBorder
              ? const BorderSide(color: C.lightGray)
              : BorderSide.none,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        labelText: widget.hintText,
        labelStyle:
            const TextStyle(color: C.lightGray, fontWeight: FontWeight.normal),
        errorText: widget.errorText,
        contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p18),
        // fillColor: Colors.white,
        // filled: true,
      ),
      onChanged: widget.onChange,
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validate,
    );
  }

  void _toggleVisibilityIcon() {
    setState(() {
      _shouldShowAsPasswordText = !_shouldShowAsPasswordText;
      if (_shouldShowAsPasswordText) {
        _passwordIcon = Icons.visibility;
      } else {
        _passwordIcon = Icons.visibility_off;
      }
    });
  }
}
