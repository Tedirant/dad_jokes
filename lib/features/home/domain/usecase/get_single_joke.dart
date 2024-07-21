import 'package:dad_jokes/features/home/data/mapper/joke_mapper.dart';
import 'package:dad_jokes/features/home/domain/entity/joke_entity.dart';
import 'package:dad_jokes/features/home/domain/repository/i_jokes_repository.dart';

class GetSingleJoke {
  final IJokesRepository repository;
  final JokeMapper mapper;

  GetSingleJoke({required this.mapper, required this.repository});

  Future<JokeEntity> getSingleJoke() async {
    final response = await repository.fetchJoke();
    final joke = mapper.mapResponse(response);

    return joke;
  }
}
