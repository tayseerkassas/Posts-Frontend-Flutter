import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:posts/Login.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;

  // TextEditingControllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // تسجيل المستخدم
  Future<void> registerUser() async {
    isLoading.value = true;

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    var body = json.encode({
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "password_confirmation": confirmPasswordController.text,
    });

    try {
      var request = http.Request('POST', Uri.parse('http://192.168.1.111:8000/api/register'));
      request.body = body;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final result = await response.stream.bytesToString();
        final data = json.decode(result);
        Get.snackbar('Success', 'Registered as ${data["name"]}');
        print(data); // أو احفظ المستخدم مثلاً
        Get.to(Login());
      } else {
        final errorMsg = await response.stream.bytesToString();
        Get.snackbar('Error', 'Registration failed: $errorMsg');
        print(errorMsg);
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
