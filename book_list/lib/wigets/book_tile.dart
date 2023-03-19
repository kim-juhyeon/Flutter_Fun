import 'package:flutter/material.dart';

class BookTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  const BookTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Image.network(image),
      onTap: () {},
    );
  }
}
