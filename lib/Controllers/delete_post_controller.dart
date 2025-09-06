import 'dart:convert';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class PostDeleteController extends GetxController {
  final String token; // التوكين لازم نمرره عند إنشاء الكنترولر

  var isLoading = false.obs;
  var message = ''.obs;

  PostDeleteController({required this.token});

  Future<void> deletePost(int postId) async {
    isLoading.value = true;
    message.value = '';

    var headers = {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    };

    try {
      var dio = Dio();
      var response = await dio.request(
        'http://192.168.1.111:8000/api/posts/$postId',
        options: Options(
          method: 'DELETE',
          headers: headers,
        ),
      );

      if (response.statusCode == 200) {
        message.value = response.data["message"] ?? "Deleted successfully";
        Get.snackbar("Post Deleted successfully","");

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
