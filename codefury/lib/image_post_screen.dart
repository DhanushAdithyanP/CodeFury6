import 'package:codefury/image_post.dart';
import 'package:flutter/material.dart';

class ImagePostScreen extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> usernames;
  final List<String> profilepath;

  ImagePostScreen({required this.imagePaths, required this.usernames, required this.profilepath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return ImagePost(
            imagePath: imagePaths[index],
            username: usernames[index],
            profilePicturePath: profilepath[index],
          );
        },
      ),
    );
  }
}
