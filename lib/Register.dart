import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/Controllers/Register_controller.dart';
import 'package:posts/Login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegisterController registerController = Get.put(RegisterController());

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
                        "Register",
                        style: TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: registerController.nameController,
                        icon: Icons.person,
                        hint: 'Name',
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: registerController.emailController,
                        icon: Icons.email,
                        hint: 'Email',
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: registerController.passwordController,
                        icon: Icons.lock,
                        hint: 'Password',
                        obscure: true,
                      ),
                      const SizedBox(height: 20),
                      _buildTextField(
                        controller: registerController.confirmPasswordController,
                        icon: Icons.lock_outline,
                        hint: 'Confirm Password',
                        obscure: true,
                      ),
                      const SizedBox(height: 40),
                      Obx(() => Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(40, 150, 110, 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 60,
                        child: MaterialButton(
                          onPressed: registerController.isLoading.value
                              ? null
                              : () {
                            registerController.registerUser();
                          },
                          child: registerController.isLoading.value
                              ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                              : const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                      ),
SizedBox(height: 20,),
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
                            Get.to(Login());
                          },
                          child: const Text(
                            "Login",
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

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required String hint,
    bool obscure = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(246, 247, 235, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: const Color.fromRGBO(30, 140, 137, 1.0)),
          hintText: hint,
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
    );
  }
}
