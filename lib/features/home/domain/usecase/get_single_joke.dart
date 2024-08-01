import 'package:dad_jokes/features/home/data/mapper/joke_mapper.dart';
import 'package:dad_jokes/features/home/data/model/joke_response.dart';
import 'package:dad_jokes/features/home/domain/entity/joke_entity.dart';
import 'package:dad_jokes/features/home/domain/repository/i_jokes_repository.dart';

class GetSingleJokeUseCase {
  final IJokesRepository repository;
  final JokeMapper mapper;

  GetSingleJokeUseCase({required this.mapper, required this.repository});

  Future<JokeEntity> getSingleJoke() async {
    JokeResponse jokeResponse;
    do {
      jokeResponse = await repository.fetchJoke();
    } while (jokeResponse.joke!.contains("? ") == false);

    return mapper.mapResponse(jokeResponse);
  }
}
