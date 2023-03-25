import 'package:dd3_challenge/src/presentation/pages/home/home_controller.dart';
import 'package:dd3_challenge/src/presentation/widgets/item_character_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Characters'),
        ),
        body: Stack(
          children: [
            Obx(
              () => Positioned.fill(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          controller: controller.scrollController,
                          physics: BouncingScrollPhysics(),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                          itemCount: controller.characterList.length,
                          itemBuilder: (context, index) {
                            final character = controller.characterList[index];
                            return ItemCharacterCard(
                              character: character,
                              onPressed: () =>
                                  controller.onClickCharacter(character),
                            );
                          },
                        ),
                      ),
                      Visibility(
                        visible: controller.loadMoreCharacters.value,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(() {
              if (controller.characterList.length == 0) {
                return Positioned.fill(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return Container();
              }
            })
          ],
        ));
  }
}
