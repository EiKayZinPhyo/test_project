import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCurve extends StatefulWidget {
  final bool showBackButton;
  final Color? customColor;

  const CustomCurve({super.key, this.showBackButton = false, this.customColor});

  @override
  State<CustomCurve> createState() => _CustomCurveState();
}

class _CustomCurveState extends State<CustomCurve>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final curveSize = MediaQuery.of(context).size.width*0.7;
    final Color curveColor =
        widget.customColor ?? Theme.of(context).colorScheme.primaryContainer;
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final wave = sin(_controller.value * 2 * pi) * 8;
        final sideWave = cos(_controller.value * 2 * pi) * 5;

        return Stack(
          children: [
            // Top curve
            Positioned(
              top: -curveSize * 0.55 + wave,
              left: -curveSize * 0.55 + sideWave,
              child: Container(
                width: curveSize,
                height: curveSize,
                decoration: BoxDecoration(
                  color: curveColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(500),
                    bottomLeft: Radius.circular(500),
                  ),
                ),
              ),
            ),

            // ✅ Back button (only if enabled)
            if (widget.showBackButton)
              Positioned(
                top: 40,
                left: 16,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.of(context).maybePop(),
                  child: const Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),

            // Bottom curve
            Positioned(
              bottom: -curveSize * 0.55 - wave,
              right: -curveSize * 0.55 - sideWave,
              child: Container(
                width: curveSize,
                height: curveSize,
                decoration: BoxDecoration(
                  color: curveColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(500),
                    topRight: Radius.circular(500),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
