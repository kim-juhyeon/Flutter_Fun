import 'package:flutter/material.dart';

import '../models/book.dart';
import 'detail_screen.dart';

class BookTile extends StatelessWidget {
  final Book book;
  BookTile({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      leading: Image.network(book.image),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailScreen(
            book: book,
          ),
        ));
      },
    );
  }
}
