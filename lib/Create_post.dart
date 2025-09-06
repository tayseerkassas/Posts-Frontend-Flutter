import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/post_create_controller.dart';

class CreatePostPage extends StatelessWidget {
  final PostCreateController controller = Get.put(PostCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("New Post", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Title",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              controller: controller.titleController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Enter post title",
                hintStyle: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Content",
                style: TextStyle(color: Colors.white, fontSize: 18)),
            const SizedBox(height: 8),
            TextField(
              controller: controller.contentController,
              maxLines: 8,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Enter post content...",
                hintStyle: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: controller.isLoading.value
                    ? null
                    : controller.createPost,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Create Post",
                    style: TextStyle(fontSize: 18,color: Colors.white)),
              ),
            ),
            const SizedBox(height: 10),
            if (controller.message.isNotEmpty)
              Text(
                controller.message.value,
                style: TextStyle(
                    color: controller.message.value.contains("success")
                        ? Colors.green
                        : Colors.redAccent),
              ),
          ],
        )),
      ),
    );
  }
}
