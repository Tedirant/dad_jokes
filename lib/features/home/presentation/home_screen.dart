import 'package:dad_jokes/features/home/presentation/bloc/jokes_bloc.dart';
import 'package:dad_jokes/features/home/presentation/bloc/jokes_event.dart';
import 'package:dad_jokes/features/home/presentation/widgets/button.dart';
import 'package:dad_jokes/features/home/presentation/widgets/joke_question_answer_container.dart';
import 'package:dad_jokes/widgets/app_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<JokesBloc>().add(FetchSingleJokeEvent());
  }

  bool isShowAnswer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AppBackground(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset('assets/images/smile.png', height: 200),
                const SizedBox(height: 30),
                JokeQuestionAnswerContainer(
                  isShowAnswer: isShowAnswer,
                  onChange: (newVal) {
                    isShowAnswer = newVal;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 20),
                Button(
                  onTap: () {
                    isShowAnswer = true;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
