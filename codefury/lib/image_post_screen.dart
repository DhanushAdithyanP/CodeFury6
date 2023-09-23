import 'package:codefury/image_post.dart';
import 'package:flutter/material.dart';

class ImagePostScreen extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> usernames;

  ImagePostScreen({required this.imagePaths, required this.usernames});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Posts'),
      ),
      body: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return ImagePost(
            imagePath: imagePaths[index],
            username: usernames[index],
          );
        },
      ),
    );
  }
}
