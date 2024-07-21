import 'package:dad_jokes/features/home/data/model/joke_response.dart';

abstract class IJokesRepository {
  Future<JokeResponse> fetchJoke();
}
