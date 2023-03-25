import 'package:dd3_challenge/src/data/repositories/character_repo_impl.dart';
import 'package:dd3_challenge/src/presentation/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
      characterRepository: CharacterRepositoryImpl(),
    ));
  }
}
