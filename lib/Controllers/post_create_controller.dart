// post_create_controller.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:posts/MyPosts.dart';
import 'package:posts/SessionManager.dart';
import 'package:posts/UserHome.dart';
import 'package:posts/shared_preferences.dart';

class PostCreateController extends GetxController {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  var isLoading = false.obs;
  var message = ''.obs;

  Future<void> createPost() async {
    isLoading.value = true;
    message.value = '';
    String? token = SessionManager().getToken();
    final url = Uri.parse('http://192.168.1.111:8000/api/posts');
// final token_ =getToken();
    var headers = {
      'Authorization':
      'Bearer ${token}',
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };

    final body = jsonEncode({
      'title': titleController.text.trim(),
      'content': contentController.text.trim(),
    });

    final request = http.Request('POST', url)
      ..headers.addAll(headers)
      ..body = body;

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonData = json.decode(responseBody);
        message.value = jsonData['massage'];
        titleController.clear();
        contentController.clear();

        Get.snackbar("Post created successfully", "");
        Get.to(MyPosts());
      } else {
        message.value = 'Failed to create post: ${response.reasonPhrase}';
      }
    } catch (e) {
      message.value = 'Error: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
