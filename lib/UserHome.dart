import 'package:flutter/material.dart';
import 'package:posts/Create_post.dart';
import 'package:posts/Home.dart';
import 'package:get/get.dart';
import 'package:posts/MyPosts.dart';

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(206, 255, 255, 1.0)),
        ),
        backgroundColor: const Color.fromRGBO(50, 140, 110, 1.0),
        actions: [

        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Home Page",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 30),

              // Browse Books
              InkWell(child:     buildCard(
                title: "Browse All Posts",
                description:
                " ",
                colors: [Color(0xFF004E64),
                  Color(0xFF008891)],
                icon: Icons.library_books,
              ),
              onTap: (){
                Get.to(Home());
              },
              ),

              const SizedBox(height: 16),

              // Favorite Books
              InkWell(child:   buildCard(
                title: "See Your Posts",
                description:
                "A list of your  posts.",
                colors: [Color(0xFF863C49),
                  Color(0xFFC2737B)],
                icon: Icons.star_border,
              ),
                onTap: (){
                  Get.to(MyPosts());
                },
              ),

              const SizedBox(height: 16),
InkWell(child:  buildCard(
  title: "Creat Your Own Post",
  description: "  ",
  colors: [Color(0xFF004237),
    Color(0xFF00AA92)
    ],
  icon: Icons.menu_book,
),
onTap: (){
  Get.to(CreatePostPage());
},
),
              // My Books

              const SizedBox(height: 16),

              // Wishlist
              // buildCard(
              //   title: "Wishlist",
              //   description:
              //   "A list of books that you would like to read or explore later.",
              //   colors: [Color(0xFF056608),
              //     Color(0xFF90EE90)],
              //   icon: Icons.bookmark_border,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard({
    required String title,
    required String description,
    required List<Color> colors,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // النصوص
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),

          // الأيقونة كـ خلفية شفافة
          Icon(
            icon,
            size: 100,
            color: Colors.white.withOpacity(0.3),
          ),
        ],
      ),
    );
  }
}
