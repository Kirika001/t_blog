import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_jccapi/ui/detail/detail_controller.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text("Detail Artikel",),
          ),
          body: controller.articleDetailModel != null ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Text(controller.articleDetailModel?.data?.title ?? '', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                )),
                Text("\n${controller.articleDetailModel?.data?.author}, ${controller.articleDetailModel?.data?.createdAt}\n"?? ''),
                Image.network(controller.articleDetailModel?.data?.image ?? ''),
                Text("\n${controller.articleDetailModel?.data?.content}\n"),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                      onPressed: () {
                        Get.toNamed("/update", arguments: {
                          "id" : controller.argumentData['id']
                        });
                      },
                      child: const Text("Edit Artikel",
                          style: TextStyle(color: Colors.white))),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black)
                  ),
                  child: TextButton(
                      onPressed: () {
                        controller.delete();
                      },
                      child: const Text("Hapus Artikel")),
                )
              ],
            ),
          ) : Center(child: CircularProgressIndicator.adaptive())
        );
      }
    );
  }
}
