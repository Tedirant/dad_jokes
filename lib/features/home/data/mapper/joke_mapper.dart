import 'package:dad_jokes/features/home/data/model/joke_response.dart';
import 'package:dad_jokes/features/home/domain/entity/joke_entity.dart';

class JokeMapper {
  JokeEntity mapResponse(JokeResponse response) {
    return JokeEntity(id: response.id, joke: response.joke, status: response.status);
  }
}
