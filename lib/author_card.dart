import 'package:flutter/material.dart';
import 'package:fooderlich/circle_image.dart';
import 'package:fooderlich/fooderlich_theme.dart';

class AuthorCard extends StatelessWidget {
  final String authorName;
  final String title;
  final ImageProvider imageProvider;

  const AuthorCard(
      {Key? key,
      required this.authorName,
      required this.title,
      required this.imageProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    authorName,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    title,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                const snackBar = SnackBar(content: Text('Press Favorite'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              icon: Icon(
                Icons.favorite_border,
                size: 30,
                color: Colors.grey[400],
              ))
        ],
      ),
    );
  }
}