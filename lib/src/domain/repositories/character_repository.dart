import 'package:dd3_challenge/src/data/models/response/get_all_characters_response.dart';
import 'package:dd3_challenge/src/data/models/response/get_character_data_response.dart';

abstract class ICharacterRepository{
  Future<GetAllCharactersResponse?> getAll();
  Future<GetCharacterDataResponse?> getComicsOfCharacter(String characterId);
  Future<GetCharacterDataResponse?> getEventsOfCharacter(String characterId);
  Future<GetCharacterDataResponse?> getSeriesOfCharacter(String characterId);
  Future<GetCharacterDataResponse?> getStoriesOfCharacter(String characterId);
}