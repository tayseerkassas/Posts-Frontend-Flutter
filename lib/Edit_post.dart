// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'Controllers/edit_post_controller.dart';
//
// class EditPostPage extends StatelessWidget {
//   final int postId;
//   final String title;
//   final String content;
//   final String token;
//
//   EditPostPage({
//     required this.postId,
//     required this.title,
//     required this.content,
//     required this.token,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final PostEditController controller = Get.put(
//       PostEditController(postId: postId, token: token),
//     );
//
//     // تعبئة الحقول بالقيم الحالية
//     controller.titleController.text = title;
//     controller.contentController.text = content;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFF0F172A),
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: const Text("Edit Post", style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Obx(() => Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Title",
//                 style: TextStyle(color: Colors.white, fontSize: 18)),
//             const SizedBox(height: 8),
//             TextField(
//               controller: controller.titleController,
//               style: const TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.blueGrey[800],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 hintText: "Enter post title",
//                 hintStyle: const TextStyle(color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 20),
//             const Text("Content",
//                 style: TextStyle(color: Colors.white, fontSize: 18)),
//             const SizedBox(height: 8),
//             TextField(
//               controller: controller.contentController,
//               maxLines: 8,
//               style: const TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.blueGrey[800],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 hintText: "Enter post content...",
//                 hintStyle: const TextStyle(color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 20),
//             SizedBox(
//               width: double.infinity,
//               height: 50,
//               child: ElevatedButton(
//                 onPressed: controller.isLoading.value
//                     ? null
//                     : controller.updatePost,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.teal,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                 ),
//                 child: controller.isLoading.value
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : const Text("Update Post",
//                     style:
//                     TextStyle(fontSize: 18, color: Colors.white)),
//               ),
//             ),
//             const SizedBox(height: 10),
//             if (controller.message.isNotEmpty)
//               Text(
//                 controller.message.value,
//                 style: TextStyle(
//                     color: controller.message.value.contains("success")
//                         ? Colors.green
//                         : Colors.redAccent),
//               ),
//           ],
//         )),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/edit_post_controller.dart';
import '../Models/post_model.dart';

class EditPostPage extends StatelessWidget {
  final Post post;
  final String? token; // لازم يجيك من الـ SessionManager أو أي مكان تخزن فيه التوكين

  EditPostPage({super.key, required this.post, required this.token});

  @override
  Widget build(BuildContext context) {
    // نربط الكنترولر ونمرر post.id + token
    final controller = Get.put(PostEditController(
      postId: post.id,
      token: token!,
    ));

    // نعبّي الحقول بالقيم الحالية
    controller.titleController.text = post.title;
    controller.contentController.text = post.content;

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),

      appBar: AppBar(
        backgroundColor: Colors.teal,

        title: const Text("Edit Post", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
              const SizedBox(height: 20),

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
          SizedBox(  width: double.infinity,
              height: 50, child:  controller.isLoading.value

                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  controller.updatePost();
                },
                child: const Text("Update",style: TextStyle(fontSize: 18,color: Colors.white)),
              ),),
              const SizedBox(height: 20),
              Obx(() => Text(
                controller.message.value,
                style: const TextStyle(color: Colors.red),
              )),
            ],
          ),
        );
      }),
    );
  }
}
