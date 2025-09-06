import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../Models/post_model.dart'; // ملف الموديل

class MyPostsController extends GetxController {
  var posts = <Post>[].obs; // قائمة Observable
  var isLoading = false.obs;

  final Dio dio = Dio();

  // اجلب المنشورات
  Future<void> fetchPosts(String token) async {
    try {
      isLoading.value = true;

      var response = await dio.request(
        'http://192.168.1.111:8000/api/my-posts',
        options: Options(
          method: 'GET',
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['data'];
        posts.value = data.map((item) => Post.fromJson(item)).toList();
      } else {
        Get.snackbar("Error", response.statusMessage ?? "Unknown error");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
