import 'package:flutter/material.dart';

class ImagePost extends StatefulWidget {
  final String imagePath;
  final String username;
  final String profilePicturePath; // Add this parameter

  ImagePost({
    required this.imagePath,
    required this.username,
    required this.profilePicturePath, // Initialize the parameter
  });

  @override
  _ImagePostState createState() => _ImagePostState();
}

class _ImagePostState extends State<ImagePost> {
  bool isLiked = false;
  bool isDisliked = false;
  int likeCount = 0;
  int dislikeCount = 0;

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
        isLiked = false;
      } else {
        likeCount++;
        if (isDisliked) {
          // If disliked, remove the dislike
          dislikeCount--;
          isDisliked = false;
        }
        isLiked = true;
      }
    });
  }

  void toggleDislike() {
    setState(() {
      if (isDisliked) {
        dislikeCount--;
        isDisliked = false;
      } else {
        dislikeCount++;
        if (isLiked) {
          // If liked, remove the like
          likeCount--;
          isLiked = false;
        }
        isDisliked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;

    return Container(
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(widget.profilePicturePath), // Use the user-specific profile picture
            ),
            title: Text(
              widget.username,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: brightness == Brightness.light
                    ? Colors.black // Text color for light mode
                    : Colors.white, // Text color for dark mode
              ),
            ),
            onTap: () {
              // Add the action you want when clicking the username.
              // For example, navigate to the user's profile.
            },
          ),
          Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.thumb_up : Icons.thumb_up_alt_outlined,
                    color: isLiked ? Colors.blue : null,
                  ),
                  onPressed: toggleLike,
                ),
                Text('$likeCount'),
                IconButton(
                  icon: Icon(
                    isDisliked ? Icons.thumb_down : Icons.thumb_down_alt_outlined,
                    color: isDisliked ? Colors.red : null,
                  ),
                  onPressed: toggleDislike,
                ),
                Text('$dislikeCount'),
              ],
            ),
          ),
          // Add more post details here, like captions, comments, etc.
        ],
      ),
    );
  }
}
