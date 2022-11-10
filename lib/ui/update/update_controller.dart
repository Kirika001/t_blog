import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_jccapi/data/model/article_detail_model.dart';
import 'package:test_jccapi/data/model/delete_article_model.dart';
import 'package:test_jccapi/data/repository/repository.dart';
import 'package:test_jccapi/data/storage_core.dart';

class UpdateController extends GetxController {
  final repository = Get.find<Repository>();
  final storage = StorageCore();

  final keyForm = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  dynamic argumentData = Get.arguments;

  String? token = StorageCore().getAccessToken();
  File? gettedPhoto;
  ArticleDetailModel? articleDetailModel;
  DeleteArticleModel? deleteArticle;

  @override
  void onInit() {
    super.onInit();
    titleController.text;
    contentController.text;
    showDetail();
  }

  void showDetail() async{
    try{
      var response = await repository.getDetail(argumentData['id'] ,storage.getAccessToken() ?? '');
      articleDetailModel = response;
      update();
    } catch(e){
      return e.printError();
    }
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
    var response = await repository.postUpdateArticle(argumentData['id'],
        titleController.text, contentController.text, gettedPhoto!, token!);

    Fluttertoast.showToast(msg: response?.meta?.message ?? 'Edit gagal');
    if (response?.meta?.code == 202) {
      Get.offAllNamed('/');
    }
  }
}