import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/book_card.dart';  // Updated import path
import 'book_search_delegate.dart';
import 'package:flutter_app/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = 'All';
  
  final List<String> categories = ['All', 'Fiction', 'Non-fiction', 'Sci-Fi', 'Romance'];
    final List<Map<String, String>> books = [
    {'title': 'The Alchemist', 'author': 'Paulo Coelho', 'category': 'Fiction'},
    {'title': 'Brief History of Time', 'author': 'Stephen Hawking', 'category': 'Non-fiction'},
    {'title': 'Dune', 'author': 'Frank Herbert', 'category': 'Sci-Fi'},
    {'title': 'Pride and Prejudice', 'author': 'Jane Austen', 'category': 'Romance'},
    {'title': '1984', 'author': 'George Orwell', 'category': 'Fiction'},
    {'title': 'The Selfish Gene', 'author': 'Richard Dawkins', 'category': 'Non-fiction'},
    {'title': 'Foundation', 'author': 'Isaac Asimov', 'category': 'Sci-Fi'},
    {'title': 'Jane Eyre', 'author': 'Charlotte Bronte', 'category': 'Romance'},
    {'title': 'The Hobbit', 'author': 'J.R.R. Tolkien', 'category': 'Fiction'},
    {'title': 'Sapiens', 'author': 'Yuval Noah Harari', 'category': 'Non-fiction'},
    {'title': 'Neuromancer', 'author': 'William Gibson', 'category': 'Sci-Fi'},
    {'title': 'Outlander', 'author': 'Diana Gabaldon', 'category': 'Romance'}
  ];

  List<Map<String, String>> get filteredBooks {
    if (selectedCategory == 'All') return books;
    return books.where((book) => book['category'] == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Share'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => showSearch(
              context: context,
              delegate: BookSearchDelegate(books),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Filter
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: categories.map((category) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    child: Chip(
                      label: Text(category),
                      backgroundColor: selectedCategory == category 
                          ? AppColors.selectedTab 
                          : AppColors.nonSelectedTab,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Book List
          Expanded(
            child: ListView.builder(
              itemCount: filteredBooks.length,
              itemBuilder: (context, index) => BookCard(book: filteredBooks[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add book functionality
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
