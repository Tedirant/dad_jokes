import 'package:dad_jokes/ui/constants/app_colors.dart';
import 'package:dad_jokes/widgets/blur_circle.dart';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child: const Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: BlurCircle(300),
          ),
          Positioned(
            bottom: -50,
            left: -20,
            child: BlurCircle(150),
          ),
        ],
      ),
    );
  }
}
