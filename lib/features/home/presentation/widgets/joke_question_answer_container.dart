import 'package:dad_jokes/features/home/domain/entity/joke_entity.dart';
import 'package:dad_jokes/features/home/presentation/bloc/jokes_bloc.dart';
import 'package:dad_jokes/features/home/presentation/bloc/jokes_event.dart';
import 'package:dad_jokes/features/home/presentation/bloc/jokes_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokeQuestionAnswerContainer extends StatefulWidget {
  final bool isShowAnswer;
  final Function onChange;

  const JokeQuestionAnswerContainer({super.key, required this.isShowAnswer, required this.onChange});

  @override
  State<JokeQuestionAnswerContainer> createState() => _JokeQuestionAnswerContainerState();
}

class _JokeQuestionAnswerContainerState extends State<JokeQuestionAnswerContainer> {
  late JokeEntity joke;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            height: 350,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.5,
                color: Colors.grey.withOpacity(0.6),
              ),
              color: Colors.grey.withOpacity(0.08),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocBuilder<JokesBloc, JokesState>(
                  builder: (context, state) {
                    if (state is JokesSuccessState) {
                      joke = state.joke;
                      return Text("${joke.joke.split('? ').first}?",
                          textAlign: TextAlign.start, style: theme.textTheme.bodyLarge);
                    } else if (state is JokesLoadingState) {
                      return const Expanded(child: Center(child: CircularProgressIndicator(color: Colors.orange)));
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        widget.onChange(false);
                        context.read<JokesBloc>().add(FetchSingleJokeEvent());
                      },
                      icon: const Icon(Icons.refresh),
                    ),
                    IconButton(
                      onPressed: () async {
                        await Clipboard.setData(ClipboardData(text: joke.joke.split('? ').first));
                      },
                      icon: const Icon(Icons.content_copy_rounded),
                    )
                  ],
                )
              ],
            )),
        const SizedBox(height: 50),
        Container(
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.5,
              color: Colors.grey.withOpacity(0.2),
            ),
            color: Colors.grey.withOpacity(0.08),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(widget.isShowAnswer ? joke.joke.split('?').last : "***********",
              style: theme.textTheme.bodyMedium?..color?.withOpacity(0.3)),
        ),
      ],
    );
  }
}
