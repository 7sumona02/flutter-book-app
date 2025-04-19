import 'package:flutter/material.dart';
import 'package:flutter_app/theme/app_colors.dart';

class BookSearchDelegate extends SearchDelegate {
  final List<Map<String, String>> books;

  BookSearchDelegate(this.books);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkBrown,
      ),
      scaffoldBackgroundColor: AppColors.cream,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(onPressed: () => query = '', icon: Icon(Icons.clear)),
      ];

  @override
  Widget? buildLeading(BuildContext context) => 
      IconButton(onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) {
    final results = books.where((book) =>
        book['title']!.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView(
      children: results
          .map((book) => ListTile(
                title: Text(book['title']!, 
                    style: TextStyle(color: AppColors.darkBrown)),
                subtitle: Text(book['author']!,
                    style: TextStyle(color: AppColors.rust)),
              ))
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => buildResults(context);
}
