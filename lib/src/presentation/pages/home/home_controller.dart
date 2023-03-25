import 'package:dd3_challenge/src/data/models/objects/character.dart';
import 'package:dd3_challenge/src/domain/repositories/character_repository.dart';
import 'package:dd3_challenge/src/presentation/pages/detail/detail_binding.dart';
import 'package:dd3_challenge/src/presentation/pages/detail/detail_page.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ICharacterRepository characterRepository;

  RxList<Character> characterList = <Character>[].obs;
  RxBool _loadMoreCharacters = false.obs;
  RxBool get loadMoreCharacters => this._loadMoreCharacters;

  ScrollController scrollController = ScrollController();

  HomeController({
    required this.characterRepository,
  });

  @override
  void onReady() {
    _getData();

    this.scrollController.addListener(this._checkScrollPosition);
    super.onReady();
  }

  @override
  void onClose() {
    this.scrollController.dispose();
    super.onClose();
  }

  void _checkScrollPosition() {
    if ((this.scrollController.position.maxScrollExtent - 150) <
        this.scrollController.position.pixels) {
      if (!this._loadMoreCharacters.value) {
        this._getMoreCharacters();
      }
    }
  }

  Future<void> _getMoreCharacters() async {
    this._loadMoreCharacters.value = true;

    await Future.delayed(Duration(seconds: 2));

    this._loadMoreCharacters.value = false;
  }

  Future<void> _getData({int page = 0}) async {
    final result = await this.characterRepository.getAll();

    if (result != null) {
      if (result.code == 200) {
        this.characterList.addAll(result.data.characters);
      } else {
        // Todo: some other error message
      }
    } else {
      // TODO: show error message
    }
  }

  void onClickCharacter(Character character) {
    Get.to(
      () => DetailPage(),
      binding: DetailBinding(),
      arguments: character,
    );
  }
}
