import 'package:dad_jokes/features/home/data/model/joke_response.dart';
import 'package:dad_jokes/features/home/domain/repository/i_jokes_repository.dart';
import 'package:dio/dio.dart';

class JokesRepository implements IJokesRepository {
  final Dio dio;

  JokesRepository({required this.dio});

  @override
  Future<JokeResponse> fetchJoke() async {
    final response = await dio.get('');
    return JokeResponse.fromJson(response.data);
  }
}
