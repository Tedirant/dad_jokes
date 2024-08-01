import 'package:dad_jokes/ui/constants/app_colors.dart';
import 'package:dad_jokes/widgets/app_background.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () => Navigator.pushReplacementNamed(context, '/home'));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          const AppBackground(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/smile.png',
                  height: 200,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 160,
                  height: 10,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.elliptical(100, 20)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(0.6),
                        spreadRadius: 8,
                        blurRadius: 20,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("DAD", style: theme.textTheme.titleLarge),
                    Text("JOKES", style: theme.textTheme.titleLarge?.copyWith(color: AppColors.orange)),
                  ],
                ),
                const SizedBox(height: 150)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
