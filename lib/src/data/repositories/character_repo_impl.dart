import 'package:dd3_challenge/src/data/datasources/remote/dio_service.dart';
import 'package:dd3_challenge/src/data/models/response/get_all_characters_response.dart';
import 'package:dd3_challenge/src/data/models/response/get_character_data_response.dart';
import 'package:dd3_challenge/src/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements ICharacterRepository {
  @override
  Future<GetAllCharactersResponse?> getAll() async {
    try {
      final dio = await DioService.dio.dioService;

      final result = await dio.get('characters');

      return GetAllCharactersResponse.fromMap(result.data);
    } catch (e) {
      // Todo: lanzar exception personalizada
      return null;
    }
  }

  @override
  Future<GetCharacterDataResponse?> getComicsOfCharacter(
      String characterId) async {
    try {
      final dio = await DioService.dio.dioService;

      final result = await dio.get('characters/${characterId}/comics');

      return GetCharacterDataResponse.fromMap(result.data);
    } catch (e) {
      // Todo: lanzar exception personalizada
      return null;
    }
  }

  @override
  Future<GetCharacterDataResponse?> getEventsOfCharacter(
      String characterId) async {
    try {
      final dio = await DioService.dio.dioService;

      final result = await dio.get('characters/${characterId}/events');

      return GetCharacterDataResponse.fromMap(result.data);
    } catch (e) {
      // Todo: lanzar exception personalizada
      return null;
    }
  }

  @override
  Future<GetCharacterDataResponse?> getSeriesOfCharacter(
      String characterId) async {
    try {
      final dio = await DioService.dio.dioService;

      final result = await dio.get('characters/${characterId}/series');

      return GetCharacterDataResponse.fromMap(result.data);
    } catch (e) {
      // Todo: lanzar exception personalizada
      return null;
    }
  }

  @override
  Future<GetCharacterDataResponse?> getStoriesOfCharacter(
      String characterId) async {
    try {
      final dio = await DioService.dio.dioService;

      final result = await dio.get('characters/${characterId}/stories');

      return GetCharacterDataResponse.fromMap(result.data);
    } catch (e) {
      // Todo: lanzar exception personalizada
      return null;
    }
  }
}
