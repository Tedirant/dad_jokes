import 'package:dad_jokes/ui/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BlurCircle extends StatelessWidget {
  final double size;
  const BlurCircle(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.orange.withOpacity(0.18),
            spreadRadius: 40,
            blurRadius: 100,
          )
        ],
      ),
    );
  }
}
