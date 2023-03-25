import 'package:dd3_challenge/src/data/repositories/character_repo_impl.dart';
import 'package:dd3_challenge/src/presentation/pages/detail/detail_controller.dart';
import 'package:get/get.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => DetailController(
        characterRepository: CharacterRepositoryImpl(),
      ),
    );
  }
}
