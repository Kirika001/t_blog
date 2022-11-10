import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_jccapi/ui/create/create_controller.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateController>(
        init: CreateController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Upload Artikel"),
            ),
            body: SingleChildScrollView(
              child: Form(
                key: controller.keyForm,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.titleController,
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
                        // controller: controller.usernameController,
                        controller: controller.contentController,
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
                            : TextButton(
                                onPressed: () {
                                  controller.getSinglePhoto();
                                },
                                child: const Text("Pilih Gambar")),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                            onPressed: () {
                              if (controller.keyForm.currentState?.validate() ==
                                  true) {
                                controller.uploadArticle();
                                Get.offAllNamed('/');
                              }

                            },
                            child: const Text("Upload Artikel",
                                style: TextStyle(color: Colors.white))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
