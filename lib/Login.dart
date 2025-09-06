import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:posts/Register.dart';
import 'package:posts/controllers/login_controller.dart'; // تأكد من المسار الصحيح

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final login_email_controller = TextEditingController();
  final login_password_controller = TextEditingController();

  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(40, 150, 110, 1.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                "images/image (1).png",
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Welcome",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(246, 247, 235, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          controller: login_email_controller,
                          onChanged: (val) =>
                          loginController.email.value = val,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              color: Color.fromRGBO(30, 140, 137, 1.0),
                            ),
                            hintText: "Email",
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(23, 126, 137, 1),
                                width: 2.2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(246, 247, 235, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          controller: login_password_controller,
                          onChanged: (val) =>
                          loginController.password.value = val,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.key_outlined,
                              color: Color.fromRGBO(23, 126, 137, 1),
                            ),
                            hintText: "Password",
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(23, 126, 137, 1),
                                width: 2.2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Obx(
                            () => Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(40, 150, 110, 1.0),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 60,
                          child: MaterialButton(
                            onPressed: loginController.isLoading.value
                                ? null
                                : () {
                              loginController.login();
                            },
                            child: loginController.isLoading.value
                                ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                                : const Text(
                              "Login",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(40, 150, 110, 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 60,
                        child: MaterialButton(
                          onPressed: () {
                            Get.to(Register());
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
