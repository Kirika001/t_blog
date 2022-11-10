import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_jccapi/binding/global_binding.dart';
import 'package:test_jccapi/ui/article/article_screen.dart';
import 'package:test_jccapi/ui/create/create_screen.dart';
import 'package:test_jccapi/ui/detail/detail_screen.dart';
import 'package:test_jccapi/ui/login/login_screen.dart';
import 'package:test_jccapi/ui/register/register_screen.dart';
import 'package:test_jccapi/ui/splash/splash_screen.dart';
import 'package:test_jccapi/ui/update/update_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  GlobalBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   useMaterial3: true,
      // ),
      getPages: [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(name: "/register", page: () => const RegisterScreen()),
        GetPage(name: "/login", page: () => const LoginScreen()),
        GetPage(name: "/article", page: () => const ArticleScreen()),
        GetPage(name: "/detail", page: () => const DetailScreen()),
        GetPage(name: "/create", page: () => const CreateScreen()),
        GetPage(name: "/update", page: () => const UpdateScreen()),
      ],
      initialRoute: "/",
    );
  }
}
