// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:posts/Create_post.dart';
// // import 'package:posts/Controllers/Home_Controller.dart';
// // import 'Controllers/Home_controller.dart';
// import 'package:posts/controllers/Home_Controller.dart'; // تأكد من المسار الصحيح
//
// class Home extends StatelessWidget {
//   final Home_Controller homeController = Get.put(Home_Controller());
//
//    // Home({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       backgroundColor: const Color(0xFFE6FFF0),
//       appBar: AppBar(
//
//
//
//         title: const Text('All Posts', style: TextStyle(fontWeight: FontWeight.bold,color:  Color.fromRGBO(
//             149, 217, 217, 1.0) ),),
//
//
//
//         backgroundColor: const Color.fromRGBO(50, 140, 110, 1.0),
//
//         actions: [
//           IconButton(
//             color: Colors.black87,
//             style: ButtonStyle(),
//             icon: const Icon(Icons.room_preferences_sharp,size: 30,),
//             onPressed: () async {
//                homeController.fetchPosts(); // استدعاء الدالة المسؤولة عن تحميل البيانات
//             },
//           )
//         ],
//       ),
//
//
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Color.fromRGBO(30, 160, 137, 1.0),
//     tooltip: 'Increment',
//
//     child: Image.asset('images/image (1).png',),
//     onPressed: (){
//     Get.to(  CreatePostPage()) ;
//     } , ),
//
//
//
//       body: Obx(() {
//         if (homeController.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         return ListView.builder(
//           itemCount: homeController.posts.length,
//           itemBuilder: (context, index) {
//             final post = homeController.posts[index];
//             return Card(
//               color: Colors.white,
//               margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//               elevation: 3,
//               child: Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(post.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3C8DBC))),
//                     const SizedBox(height: 6),
//                     Text(post.content, style: const TextStyle(fontSize: 15, color: Colors.black87)),
//                     const SizedBox(height: 6),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text("By: ${post.author}", style: const TextStyle(color: Colors.grey)),
//                         Text(post.created, style: const TextStyle(color: Colors.grey, fontSize: 12)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/Create_post.dart';
import 'package:posts/controllers/Home_Controller.dart';

class Home extends StatelessWidget {
  final Home_Controller homeController = Get.put(Home_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE6FFF0),
      appBar: AppBar(
        title: const Text(
          'All Posts',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(149, 217, 217, 1.0)),
        ),
        backgroundColor: const Color.fromRGBO(50, 140, 110, 1.0),
        actions: [
          IconButton(
            color: Colors.black87,
            icon: const Icon(
              Icons.sync_rounded
              ,
              size: 34,

            ),
            onPressed: () async {
              homeController.fetchPosts();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(30, 160, 137, 1.0),
        tooltip: 'Create Post',
        child: Image.asset(
          'images/image (1).png',
        ),
        onPressed: () {
          Get.to(CreatePostPage());
        },
      ),
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: homeController.posts.length,
          itemBuilder: (context, index) {
            final post = homeController.posts[index];
            return PostCard(post: post);
          },
        );
      }),
    );
  }
}

// Widget مستقل لكل منشور مع "Read more / Read less"
class PostCard extends StatefulWidget {
  final dynamic post; // يمكنك تحديد نوع Post إذا موجود

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isExpanded = true; // حالة توسيع النص

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // عنوان المنشور
            Text(
              widget.post.title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C8DBC)),
            ),
            const SizedBox(height: 6),

            // محتوى المنشور مع التحكم في الأسطر
            Text(
              widget.post.content,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
              maxLines: isExpanded ? null : 50, // null → عرض كامل النص
              overflow: TextOverflow.ellipsis,
            ),

            // زر Read more / Read less
            if (widget.post.content.length > 50) // تقريبًا لو طويل
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? "Read more" : "Read less",
                  style: const TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),

            const SizedBox(height: 6),

            // مؤلف وتاريخ
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("By: ${widget.post.author}",
                    style: const TextStyle(color: Colors.grey)),
                Text(widget.post.created,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

