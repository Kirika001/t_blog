import 'dart:async';
import 'package:get/get.dart';
import 'package:test_jccapi/ui/login/login_screen.dart';
import 'package:test_jccapi/data/storage_core.dart';

class SplashController extends GetxController{
  final storage = StorageCore();

  @override
  void onInit() {
    storage.ensureStorageReady();
    Timer(const Duration(seconds: 3), () {
      if(storage.getAccessToken() == null || storage.getAccessToken() == "token_not_loaded"){
        Get.offAllNamed("/login");
      } else {
        Get.offAllNamed("/article");
      }

    });
    super.onInit();
  }
}