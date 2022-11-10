import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_jccapi/ui/register/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (controller) {
          return Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.key,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Register",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        TextFormField(
                          controller: controller.nameController,
                          decoration: const InputDecoration(
                            label: Text("Nama"),
                            hintText: "Nama",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Nama Kosong";
                            }
                          },
                        ),
                        TextFormField(
                          controller: controller.emailController,
                          decoration: const InputDecoration(
                            label: Text("Email"),
                            hintText: "Email",
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email Kosong";
                            } else if (EmailValidator.validate(value) == false){
                              return "contoh email : name@mail.com";
                            }
                          },
                        ),
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
                                  controller.doRegister(
                                    controller.nameController.text,
                                    controller.emailController.text,
                                    controller.usernameController.text,
                                    controller.passwordController.text,
                                  );
                                }
                              },
                              child: const Text("Register",
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
                                Get.toNamed("/login");
                              },
                              child:
                                  const Text("Sudah Memiliki akun? login disini")),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
