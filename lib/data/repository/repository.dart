import 'dart:async';
import 'dart:io';

import 'package:test_jccapi/data/model/article_detail_model.dart';
import 'package:test_jccapi/data/model/article_model.dart';
import 'package:test_jccapi/data/model/create_article_model.dart';
import 'package:test_jccapi/data/model/delete_article_model.dart';
import 'package:test_jccapi/data/model/login_model.dart';
import 'package:test_jccapi/data/model/logout_model.dart';
import 'package:test_jccapi/data/model/register_model.dart';

abstract class Repository{
  FutureOr<RegisterModel?> postRegister(String name, String email, String username, String password);
  FutureOr<LoginModel?> postLogin(String email, String password);
  FutureOr<LogoutModel> postLogout();
  FutureOr<ArticleModel?> getArticle(String token);
  FutureOr<ArticleDetailModel?> getDetail(int id, String token);
  FutureOr<CreateArticleModel?> postAricle (String title,String content, File image, String token);
  FutureOr<DeleteArticleModel?> deleteArticle (int id, String token);
  FutureOr<CreateArticleModel?> postUpdateArticle(int id,String title, String content, File? image, String token);
}