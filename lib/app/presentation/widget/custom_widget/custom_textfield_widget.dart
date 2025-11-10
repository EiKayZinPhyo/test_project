import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final bool passwordShow;
  final VoidCallback? passwordCallBack;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;
  final int? maxLines;
  final Color? textFieldColor;
  final Color? borderColor;

  final FocusNode? focusNode;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.passwordShow = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
    this.maxLines,
    this.textFieldColor,
    this.borderColor,
    this.focusNode,
    this.passwordCallBack,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveBorderColor = borderColor ?? Colors.purple;

    return SizedBox(
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: passwordCallBack != null ? !passwordShow : false,
        validator: validator,
        focusNode: focusNode,
        maxLines: maxLines ?? 1,
        style: TextStyle(
          color: Colors.black,
          fontSize: 12,
        ),
        decoration: InputDecoration(
          filled: true,

          fillColor: textFieldColor ?? Colors.black,

          hintText: hintText,

          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(
            prefixIcon,
            size: 16,
            color: Colors.purple,
          )
              : null,
          suffixIcon: isPassword
              ? IconButton(
            iconSize: 16,
            icon: Icon(
              passwordShow ? Icons.visibility : Icons.visibility_off,
              color: Colors.purple,
            ),
            onPressed: passwordCallBack,
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: effectiveBorderColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(color: effectiveBorderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: BorderSide(
              color:
              borderColor ??
                 Colors.purple,
              width: 1.2,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        ),
      ),
    );
  }
}
