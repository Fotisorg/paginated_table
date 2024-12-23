import 'package:flutter/material.dart';
import 'package:paginated_data_table_example/styles/colors.dart';
import 'dart:math' as math;

class ColoredWidget extends StatelessWidget {
  final double size;
  final Color color;
  final Color color1;

  const ColoredWidget(
      {super.key,
      required this.size,
      required this.color,
      required this.color1});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        // color: color,
        gradient: LinearGradient(
          colors: [color, color1],
        ),
      ),
      width: size,
      height: size,
      // transform: Matrix4.identity()
      //   ..translate(size / 2, size / 2)
      //   ..multiply(Matrix4.rotationZ(math.pi / 4))
      //   ..translate(-size / 2, -size / 2),
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 2),
    );
  }
}
