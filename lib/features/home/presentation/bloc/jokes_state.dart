import 'package:dad_jokes/features/home/domain/entity/joke_entity.dart';

abstract class JokesState {}

class JokesInitState extends JokesState {}

class JokesLoadingState extends JokesState {}

class JokesSuccessState extends JokesState {
  final JokeEntity joke;
  JokesSuccessState(this.joke);
}

class JokesErrorState extends JokesState {
  final String errorMessage;
  JokesErrorState(this.errorMessage);
}
