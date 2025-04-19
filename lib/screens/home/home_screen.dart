import 'package:flutter/material.dart';
import 'package:book_share/widgets/book_card.dart';  // Updated import path
import 'book_search_delegate.dart';

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
                          ? Colors.blue 
                          : Colors.grey[300],
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
