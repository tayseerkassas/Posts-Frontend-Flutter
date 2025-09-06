import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter/GetMaterialApp.dart';

import '../Models/post_model.dart';

class Home_Controller extends GetxController {
  var posts = <Post>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var headers = {'Accept': 'application/json'};
      var request = http.Request('GET', Uri.parse('http://192.168.1.111:8000/api/posts'));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final body = await response.stream.bytesToString();
        final jsonData = json.decode(body);
        final List<dynamic> postList = jsonData['data'];

        posts.value = postList.map((e) => Post.fromJson(e)).toList();
      } else {
        Get.snackbar('Error', response.reasonPhrase ?? 'Unknown error');
      }
    } catch (e) {
      Get.snackbar('Exception', e.toString());
    } finally {
      isLoading(false);
    }
  }
}
