import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:posts/Controllers/delete_post_controller.dart';
import 'package:posts/Create_post.dart';
// import 'package:posts/Controllers/Home_Controller.dart';
// import 'Controllers/Home_controller.dart';
//import 'package:posts/controllers/Home_Controller.dart'; // تأكد من المسار الصحيح
import 'package:posts/Controllers/MyPostsController.dart';
import 'package:posts/SessionManager.dart';
import 'package:posts/Edit_post.dart';

class MyPosts extends StatelessWidget {
  final MyPostsController homeController = Get.put(MyPostsController());

   //Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xFFE6FFF0),
      appBar: AppBar(



        title: const Text('Your Posts', style: TextStyle(fontWeight: FontWeight.bold,color:  Color.fromRGBO(
            149, 217, 217, 1.0) ),),



        backgroundColor: const Color.fromRGBO(50, 140, 110, 1.0),

        actions: [
          IconButton(
            color: Colors.black87,
            style: ButtonStyle(),
            icon: const Icon(Icons.sync_rounded,
              size: 30,),
            onPressed: () async {
              String? token = SessionManager().getToken();

              homeController.fetchPosts(token!); // استدعاء الدالة المسؤولة عن تحميل البيانات
            },
          )
        ],
      ),


      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(30, 160, 137, 1.0),
    tooltip: 'Increment',

    child: Image.asset('images/image (1).png',),
    onPressed: (){
    Get.to(  CreatePostPage()) ;
    } , ),



      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: homeController.posts.length,
          itemBuilder: (context, index) {
            final post = homeController.posts[index];
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
                    Text(post.title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF3C8DBC))),
                    const SizedBox(height: 6),
                    Text(post.content, style: const TextStyle(fontSize: 15, color: Colors.black87)),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("By: ${post.author}", style: const TextStyle(color: Colors.grey)),


                        Text(post.created, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                        // IconButton(onPressed: (){
                        // // Get.to(Edit_post());
                        // }, icon:Icon(Icons.edit,color: Colors.blue[700],)),

                        IconButton(
                          onPressed: () {
                            String? myToken = SessionManager().getToken();
                            Get.to(() => EditPostPage(
                              post: post,       // مرر البوست كامل
                              token: myToken,   // مرر التوكين من SessionManager
                             ));
                          },
                          icon: Icon(Icons.edit, color: Colors.blue[700]),
                        ),

                        IconButton(onPressed: () async {
                          String? myToken = SessionManager().getToken();
                          final deleteController = Get.put(PostDeleteController(token: "$myToken"));

                          
                          await deleteController.deletePost(post.id);
                          
                          // عرض النتيجة بعد الحذف
                          // Get.snackbar(
                          //   "Delete Post",
                          //   deleteController.message.value,
                          //   // snackPosition: SnackPosition.BOTTOM,
                          // );

                        }, icon:Icon(Icons.delete,color: Colors.red,)),

                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
