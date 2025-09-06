import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:posts/Home.dart';
import 'package:posts/SessionManager.dart';
import 'package:posts/UserHome.dart';
import 'package:posts/shared_preferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var email = ''.obs;
  var password = ''.obs;

  Future<void> login() async {
    isLoading.value = true;

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };

    final url = Uri.parse('http://192.168.1.111:8000/api/login');

    final body = json.encode({
      'email': email.value,
      'password': password.value,
    });

    final request = http.Request('POST', url);
    request.body = body;
    request.headers.addAll(headers);

    try {
      final response = await request.send();
      print(response.statusCode);
      print("🕐🕐🕐🕐🚨🚨🚨🚨🚨🚨🚨🚨🔴🔴");

      if (response.statusCode == 200) {
        print(response.statusCode);
        Get.snackbar("Login Success", "Welcome");
        final responseBody = await response.stream.bytesToString();
        final decoded = jsonDecode(responseBody);
        print(decoded);
       String token_ = decoded['token'] ;
       // saveToken(token_);
        SessionManager().saveToken(token_);

        print(token_);
        Get.to(UserHome());

        // if (decoded['role'] == 'admin') {

        // }
        // else if (decoded['role'] == 'user') {
        //   Get.snackbar("Login Success", "Welcome User");
        // }
        // else {
        //   Get.snackbar("Login Failed", "Unknown role");
        // }
      }
      // else {
      //   Get.snackbar("Login Failed", "Invalid credentials");
      //   print(response.reasonPhrase);
      // }
    }
    catch (e) {
      print("Error during login: $e");
      Get.snackbar("Login Failed", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }
}
