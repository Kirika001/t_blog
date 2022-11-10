import 'package:get/get.dart';
import 'package:test_jccapi/data/network_core.dart';
import 'package:test_jccapi/data/repository/repository.dart';
import 'package:test_jccapi/data/repository/repository_impl.dart';

class GlobalBindings extends Bindings{
  @override
  void dependencies() {
    Get.put<NetworkCore>(NetworkCore());
    Get.put<Repository>(RepositoryImpl());
  }
}