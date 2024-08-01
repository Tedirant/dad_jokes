import 'package:dad_jokes/features/home/domain/usecase/get_single_joke.dart';
import 'package:dad_jokes/features/home/presentation/bloc/jokes_event.dart';
import 'package:dad_jokes/features/home/presentation/bloc/jokes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JokesBloc extends Bloc<JokesEvent, JokesState> {
  final GetSingleJokeUseCase _getSingleJokeUseCase;

  JokesBloc({required GetSingleJokeUseCase getSingleJokeUseCase})
      : _getSingleJokeUseCase = getSingleJokeUseCase,
        super(JokesInitState()) {
    on<FetchSingleJokeEvent>((event, emit) async {
      emit(JokesLoadingState());
      try {
        final response = await _getSingleJokeUseCase.getSingleJoke();
        emit(JokesSuccessState(response));
      } catch (e) {
        emit(JokesErrorState(e.toString()));
      }
    });
  }
}
