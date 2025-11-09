import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final int? maxLines;
  final bool? underLine;

  const CustomText({
    super.key,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.overflow,
    this.letterSpacing,
    this.maxLines,
    this.underLine,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "",
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.visible,
      style: TextStyle(
        fontSize:
        fontSize ??
            Theme.of(context).textTheme.headlineMedium?.fontSize,
        fontWeight:
        fontWeight ??
            Theme.of(context).textTheme.headlineMedium?.fontWeight,
        color: color ?? Theme.of(context).colorScheme.onTertiary,
        letterSpacing: letterSpacing,
        decoration: underLine ?? false
            ? TextDecoration.underline
            : TextDecoration.none,
        decorationColor: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
