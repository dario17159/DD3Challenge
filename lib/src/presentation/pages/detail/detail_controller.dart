import 'package:dd3_challenge/src/data/models/objects/character.dart';
import 'package:dd3_challenge/src/data/models/objects/detail_data.dart';
import 'package:dd3_challenge/src/domain/repositories/character_repository.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  final ICharacterRepository characterRepository;
  Character? character;

  RxBool _gettingData = true.obs;
  RxBool get gettingData => this._gettingData;
  List<DataDetailUi> dataDetailUIList = [];

  List<String> _sections = ['Comics', 'Events', 'Series', 'Stories'];

  DetailController({
    required this.characterRepository,
  });
  @override
  void onInit() {
    this.character = Get.arguments as Character;
    super.onInit();
  }

  @override
  void onReady() {
    _getData();
    super.onReady();
  }

  Future<void> _getData() async {
    final result = await Future.wait([
      this.characterRepository.getComicsOfCharacter(this.character!.id),
      this.characterRepository.getEventsOfCharacter(this.character!.id),
      this.characterRepository.getSeriesOfCharacter(this.character!.id),
      this.characterRepository.getStoriesOfCharacter(this.character!.id),
    ]);

    int index = 0;
    for (var data in result) {
      if (data!.data.detailData.length != 0) {
        this.dataDetailUIList.add(
              DataDetailUi(_sections[index], data.data.detailData),
            );
      }
      index++;
    }
    this._gettingData.value = false;
  }

  get getCharacterImage {
    return '${this.character?.thumbnail.path}.${this.character?.thumbnail.extension}';
  }
}

class DataDetailUi {
  final String section;
  final List<DetailData> fullDetail;

  DataDetailUi(this.section, this.fullDetail);
}
