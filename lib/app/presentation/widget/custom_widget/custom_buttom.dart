import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final Color? borderColor; // 👈 optional border color
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final bool? disable;

  const CustomButton({
    super.key,
    this.text,
    this.child,
    required this.onPressed,
    this.color,
    this.textColor,
    this.borderColor, // 👈 added here
    this.width,
    this.height,
    this.disable,
    this.borderRadius,
  }) : assert(
  text != null || child != null,
  'Either text or child must be provided',
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: disable ?? false
            ? Theme.of(context).colorScheme.onSecondary.withValues(alpha: 0.4)
            : color ?? Theme.of(context).colorScheme.primary,
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        border: borderColor != null
            ? Border.all(color: borderColor!, width: 1.2)
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: disable ?? false ? null : onPressed,
          splashColor: Theme.of(
            context,
          ).colorScheme.secondaryContainer.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(4),

          child: Center(
            child:
            child ??
                Text(
                  text!,
                  style: TextStyle(
                    color: textColor ?? Theme.of(context).colorScheme.tertiary,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
