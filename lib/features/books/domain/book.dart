import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String title;
  final String author;
  final String category;
  final String uri;

  Book({
    required this.title,
    required this.author,
    required this.category,
    required this.uri,
  });

  factory Book.fromDocumentSnapshot(
      {required DocumentSnapshot<Map<String, dynamic>> doc}) {
    return Book(
      title: doc.data()!["title"],
      author: doc.data()!["author"],
      category: doc.data()!["category"],
      uri: doc.data()!["uri"],
    );
  }
}
