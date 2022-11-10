import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_jccapi/ui/detail/detail_controller.dart';
import 'package:test_jccapi/ui/update/update_controller.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateController>(
        init: UpdateController(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: Text("Edit Artikel"),
              ),
              body: controller.articleDetailModel != null ? Form(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      TextFormField(
                        controller: controller.titleController
                          ..text = controller.articleDetailModel?.data?.title ?? '',
                        decoration: const InputDecoration(
                          label: Text("Title"),
                          hintText: "Title",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Title Kosong";
                          }
                        },
                      ),
                      TextFormField(
                        controller: controller.contentController
                          ..text = controller.articleDetailModel?.data?.content ?? '',
                        maxLines: 5,
                        decoration: const InputDecoration(
                          label: Text("Content"),
                          hintText: "Content",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Content Kosong";
                          }
                        },
                      ),
                      const SizedBox(height: 16),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: controller.gettedPhoto != null
                            ? Image.file(
                          controller.gettedPhoto!,
                          fit: BoxFit.fill,
                        )
                            : GestureDetector(
                            onTap: (){
                              controller.getSinglePhoto();
                            },
                            child: Image.network(controller.articleDetailModel?.data?.image ?? '')),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                            onPressed: () {
                              // if (controller.keyForm.currentState?.validate() ==
                              //     true) {
                                controller.uploadArticle();
                              // }

                            },
                            child: const Text("Edit Artikel",
                                style: TextStyle(color: Colors.white))),
                      ),
                    ],
                  ),
                ),
              ) : Center(child: CircularProgressIndicator.adaptive())
          );
        }
    );
  }
}
