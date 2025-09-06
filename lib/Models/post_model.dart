// class Post {
//   final String author;
//   final String title;
//   final String content;
//   final String created;
//
//   Post({required this.author, required this.title, required this.content, required this.created});
//
//   factory Post.fromJson(Map<String, dynamic> json) {
//     return Post(
//       author: json['author'],
//       title: json['title'],
//       content: json['content'],
//       created: json['created'],
//     );
//   }
// }
class Post {
  final int id;
  final String author;
  final String title;
  final String content;
  final String created;

  Post({
    required this.id,
    required this.author,
    required this.title,
    required this.content,
    required this.created,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'], // لازم Laravel API يرجع id
      author: json['author'],
      title: json['title'],
      content: json['content'],
      created: json['created'],
    );
  }
}
