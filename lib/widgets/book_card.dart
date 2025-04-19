import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final Map<String, String> book;

  const BookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(book['title']!),
        subtitle: Text('by ${book['author']}'),
        trailing: Text(book['category']!),
      ),
    );
  }
}
