import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_jccapi/data/model/login_model.dart';
import 'package:test_jccapi/ui/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
          init: LoginController(),
          builder: (controller) {
            return Form(
              key: controller.key,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Login",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    TextFormField(
                      controller: controller.usernameController,
                      decoration: const InputDecoration(
                        label: Text("Username"),
                        hintText: "Username",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Username Kosong";
                        }
                      },
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        label: Text("Password"),
                        hintText: "Password",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password Kosong";
                        } else if (value.length < 8) {
                          return "Password harus terdiri dari 8 karakter";
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                          onPressed: () {
                            if (controller.key.currentState?.validate() ==
                                true) {
                              print("OK");
                              controller.doLogin(
                                  controller.usernameController.text,
                                  controller.passwordController.text);
                            }
                          },
                          child: const Text("Login",
                              style: TextStyle(color: Colors.white))),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black)),
                      child: TextButton(
                          onPressed: () {
                            Get.toNamed("/register");
                          },
                          child: const Text("Register")),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
