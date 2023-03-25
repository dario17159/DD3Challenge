import 'package:dd3_challenge/src/presentation/pages/detail/detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class DetailPage extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                controller.character?.name ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              background: Image.network(
                controller.getCharacterImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Obx(() {
            if (controller.gettingData.value) {
              return SliverFillRemaining(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              if (controller.dataDetailUIList.length != 0) {
                return SliverList(
                  delegate: SliverChildListDelegate(
                    List.generate(
                      controller.dataDetailUIList.length,
                      (index) {
                        final category = controller.dataDetailUIList[index];
                        return ExpansionTile(
                          title: Text(category.section),
                          children: List.generate(
                            category.fullDetail.length,
                            (index) {
                              final item = category.fullDetail[index];
                              return ListTile(
                                contentPadding: EdgeInsets.all(8),
                                leading: item.thumbnail != null
                                    ? FadeInImage.memoryNetwork(
                                        width: 38,
                                        placeholder: kTransparentImage,
                                        fit: BoxFit.cover,
                                        image:
                                            '${item.thumbnail!.path}.${item.thumbnail!.extension}',
                                      )
                                    : null,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      item.description ?? '',
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                );
              } else {
                return SliverFillRemaining(
                  child: Center(child: Text('No data')),
                );
              }
            }
          })
        ],
      ),
    );
  }
}
