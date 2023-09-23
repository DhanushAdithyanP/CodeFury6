import 'package:codefury/image_post_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // To keep track of the current tab index

  final List<String> imagePaths = [
    'assets/images/image_1.jpeg',
    'assets/images/image_2.jpeg',
    'assets/images/image_3.png',
    'assets/images/image_4.png'
  ];

  final List<String> usernames = [
    'User1',
    'User2',
    'User3',
    'User4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return ImagePost(
            imagePath: imagePaths[index],
            username: 'WHO',
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          // Handle bottom navigation item taps
          setState(() {
            _currentIndex = index;
          });

          // Check if the Search button was pressed (index 1), and navigate to ImagePostScreen if so
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImagePostScreen(
                  imagePaths: imagePaths,
                  usernames: usernames,
                ),
              ),
            );
          }
        },
        backgroundColor: Colors.grey[900], // Dark background color
        selectedItemColor: Colors.blue, // Color for the selected item icon and text
        unselectedItemColor: Colors.white, // Color for unselected item icons and text
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Posts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Journal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.man),
            label: 'Activities',
          ),
        ],
      ),
    );
  }
}

class ImagePost extends StatelessWidget {
  final String imagePath;
  final String username;

  ImagePost({required this.imagePath, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
      body: Center(
        child: Image.asset(imagePath),
      ),
    );
  }
}
