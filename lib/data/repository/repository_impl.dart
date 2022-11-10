import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:test_jccapi/data/model/article_detail_model.dart';
import 'package:test_jccapi/data/model/article_model.dart';
import 'package:test_jccapi/data/model/create_article_model.dart';
import 'package:test_jccapi/data/model/delete_article_model.dart';
import 'package:test_jccapi/data/model/login_model.dart';
import 'package:test_jccapi/data/model/logout_model.dart';
import 'package:test_jccapi/data/model/register_model.dart';
import 'package:test_jccapi/data/network_core.dart';
import 'package:test_jccapi/data/repository/repository.dart';

class RepositoryImpl implements Repository {
  final network = Get.find<NetworkCore>();

  @override
  FutureOr<ArticleModel?> getArticle(String token) async {
    try {
      var response = await network.dio.get("/post",
          options: Options(headers: {
            "Accept": "applicatin/json",
            "Authorization": "Bearer $token"
          }));
      return ArticleModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return e.error;
    }
  }

  @override
  FutureOr<ArticleDetailModel?> getDetail(int id, String token) async {
    try {
      var response = await network.dio.get("/post/$id",
          options: Options(headers: {
            "Accept": "applicatin/json",
            "Authorization": "Bearer $token"
          }));
      return ArticleDetailModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return null;
    }
  }

  @override
  FutureOr<CreateArticleModel?> postAricle(
      String title, String content, File? image, String token) async {
    try {
      var formData = FormData.fromMap({
        "title": title,
        "content": content,
      });

      if(image != null) {
        formData.files.addAll([
          MapEntry("image", await MultipartFile.fromFile(image.path))
        ]);
      }

      var response = await network.dio.post("/post",
          data: formData,
          options: Options(headers: {
            "Accept": "applicatin/json",
            "Authorization": "Bearer $token",
            "Content-Type": "multipart/form-data"
          })
      );
      print(response.data);
      return CreateArticleModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response?.data);
      return CreateArticleModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<LoginModel?> postLogin(String email, String password) async {
    try {
      var response = await network.dio
          .post("/login", data: {"username": email, "password": password});

      return LoginModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.error);
      return LoginModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<RegisterModel?> postRegister(
      String name, String email, String username, String password) async {
    try {
      var response = await network.dio.post("/register", data: {
        "name": name,
        "email": email,
        "username": username,
        "password": password
      });

      return RegisterModel.fromJson(response.data);
    } on DioError catch (e) {
      return RegisterModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<LogoutModel> postLogout() async {
    try {
      var response = await network.dio.post("/logout",
          options: Options(headers: {"Accept": "application/json"}));
      print(response.data);
      return LogoutModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response?.data.toString());
      return LogoutModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<DeleteArticleModel?> deleteArticle(int id, String token) async {
    try{
      var response = await network.dio.delete("/post/$id",
          options: Options(headers: {
            "Accept": "application/json",
            "Authorization": "Bearer $token",
          }));

      return DeleteArticleModel.fromJson(response.data);
    }on DioError catch(e){
      print(e.response?.data);
      return DeleteArticleModel.fromJson(e.response?.data);
    }
  }

  @override
  FutureOr<CreateArticleModel?> postUpdateArticle(int id, String title, String content, File? image, String token) async {
    try {
      var formData = FormData.fromMap({
        "title": title,
        "content": content,
      });

      if (image != null) {
        formData.files.addAll(
            [MapEntry("image", await MultipartFile.fromFile(image.path))]);
      }

      var response = await network.dio.post("/post/$id",
          data: formData,
          options: Options(headers: {
            "Authorization": "Bearer $token",
            "Accept": "application/json",
            "Content-Type": "multipart/form-data"
          }));
      return CreateArticleModel.fromJson(response.data);
    } on DioError catch(e){
      print(e.response?.data);
      return CreateArticleModel.fromJson(e.response?.data);
    }
  }
}
