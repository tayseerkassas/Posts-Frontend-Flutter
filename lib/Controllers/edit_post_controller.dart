

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:posts/MyPosts.dart';

class PostEditController extends GetxController {
  final int postId;
  final String token;
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  var isLoading = false.obs;
  var message = ''.obs;

  PostEditController({required this.postId, required this.token});

  Future<void> updatePost() async {
    isLoading.value = true;
    message.value = '';

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    var data = json.encode({
      "title": titleController.text.trim(),
      "content": contentController.text.trim(),
    });

    try {
      var dio = Dio();
      var response = await dio.request(
        'http://192.168.1.111:8000/api/posts/$postId',
        options: Options(method: 'PUT', headers: headers),
        data: data,
      );

      if (response.statusCode == 200) {
        message.value = response.data["message"] ?? "Post updated successfully";
        Get.snackbar("Post updated successfully", "");
        Get.to(MyPosts());
      } else {
        message.value = "Error: ${response.statusMessage}";
      }
    } catch (e) {
      message.value = "Exception: $e";
    } finally {
      isLoading.value = false;
    }
  }
}

