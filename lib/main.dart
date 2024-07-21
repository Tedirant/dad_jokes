import 'package:dad_jokes/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'ui/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme,
        initialRoute: "/home",
        routes: {
          "/": (context) => const SplashScreen(),
          "/home": (context) => const HomeScreen(),
        },
      ),
    );
  }
}
