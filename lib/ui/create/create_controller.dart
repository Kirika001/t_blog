import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:test_jccapi/data/repository/repository.dart';
import 'package:test_jccapi/data/storage_core.dart';
import 'package:image_picker/image_picker.dart';

class CreateController extends GetxController {
  final repository = Get.find<Repository>();

  final keyForm = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  String? token = StorageCore().getAccessToken();
  File? gettedPhoto;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    titleController.text;
    contentController.text;
    update();
  }

  getSinglePhoto() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File file = File(image.path);
      gettedPhoto = file;
      update();
    } else {
      // User canceled the picker
    }
  }

  uploadArticle() async {
    var response = await repository.postAricle(
        titleController.text, contentController.text, gettedPhoto!, token!);

    Fluttertoast.showToast(msg: response?.meta?.message ?? 'upload gagal');
    if (response?.meta?.code == 200) {
      Get.offAllNamed('/article');
    }
  }
}