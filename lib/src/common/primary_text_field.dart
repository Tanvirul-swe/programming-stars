// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:programming_stars/src/constant/app_color.dart';

class PrimaryTextField extends StatefulWidget {
  PrimaryTextField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.onChanged,
    required this.hintText,
    this.prefixIcon = '',
    this.isSuffixIcon = false,
    this.isObscure = false,
    required this.validator,
    this.isLimitLetter = false,
    this.isPrefix = true,
    this.iconColor = AppColors.primaryColorDark,
    this.borderReadius = 6.0,
    this.labelText,
    this.isSvgIcon = false,
    this.errorText,
    this.inputFormater = const [],
  }) : super(key: key);
  final TextEditingController controller;
  final TextInputType textInputType;
  final void Function(String)? onChanged;
  final String hintText;
  final String prefixIcon;
  final bool isSuffixIcon;
  bool isObscure;
  final String? Function(String?)? validator;
  final bool isLimitLetter;
  final bool isPrefix;
  final Color iconColor;
  final double borderReadius;
  final String? labelText;
  final bool isSvgIcon;
  final String? errorText;
  List<TextInputFormatter> inputFormater = [];

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primaryColor,
      inputFormatters: [
        widget.isLimitLetter
            ? LengthLimitingTextInputFormatter(14)
            : LengthLimitingTextInputFormatter(null),
        ...widget.inputFormater
      ],
      validator: widget.validator,
      obscureText: widget.isObscure,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
          prefixIcon: widget.isPrefix && widget.prefixIcon.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: !widget.isSvgIcon
                      ? Image.asset(
                          widget.prefixIcon,
                          height: 24,
                          width: 24,
                          color: widget.iconColor,
                        )
                      : SvgPicture.asset(
                          widget.prefixIcon,
                          height: 24,
                          width: 24,
                          color: widget.iconColor,
                        ))
              : null,
          suffixIcon: widget.isSuffixIcon
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.isObscure = !widget.isObscure;
                    });
                  },
                  child:  Icon( widget.isObscure ?Icons.visibility: Icons.visibility_off,
                      color: AppColors.primaryGrayColor),
                )
              : const SizedBox(),
          contentPadding: EdgeInsets.all(
              widget.isPrefix && widget.prefixIcon.isEmpty ? 12 : 0),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffD5D5D5), width: 1),
            borderRadius: BorderRadius.circular(widget.borderReadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffD5D5D5), width: 1),
            borderRadius: BorderRadius.circular(widget.borderReadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffD5D5D5), width: 1),
            borderRadius: BorderRadius.circular(widget.borderReadius),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffD5D5D5), width: 1),
            borderRadius: BorderRadius.circular(widget.borderReadius),
          ),
          filled: true,
          errorText: widget.errorText,
          labelStyle: const TextStyle(
              color: AppColors.primaryGrayColor,
              fontSize: 14,
              fontWeight: FontWeight.w700),
          labelText: widget.hintText,
          hintText: widget.labelText,
          hintStyle: const TextStyle(
              color: AppColors.primaryGrayColor,
              fontSize: 14,
              fontWeight: FontWeight.w700),
          fillColor: Colors.white70),
    );
  }
}
