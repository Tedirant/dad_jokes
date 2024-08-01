import 'package:dad_jokes/core/services/dio.dart';
import 'package:dad_jokes/features/home/data/mapper/joke_mapper.dart';
import 'package:dad_jokes/features/home/data/repository/jokes_repository.dart';
import 'package:dad_jokes/features/home/domain/usecase/get_single_joke.dart';
import 'package:dad_jokes/features/home/presentation/bloc/jokes_bloc.dart';
import 'package:dad_jokes/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'ui/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // make navigation bar transparent
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  // make flutter draw behind navigation bar
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JokesBloc>(
      create: (context) => JokesBloc(
        getSingleJokeUseCase: GetSingleJokeUseCase(
          mapper: JokeMapper(),
          repository: JokesRepository(
            dio: DioSettings().dio,
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: theme,
          initialRoute: "/",
          routes: {
            "/": (context) => const SplashScreen(),
            "/home": (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}
