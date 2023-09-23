import 'package:codefury/activities.dart';
import 'package:codefury/contacts.dart';
import 'package:codefury/image_post_screen.dart';
import 'package:codefury/journal/screens/Journal_screen.dart';
import 'package:codefury/load_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'quotescreen',
      routes: {
        'quotescreen': (context) => QuoteScreen(),
        'homescreen': (context) => HomeScreen(),
      },
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
    ));
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<String> imagePaths = [
    'assets/images/image_1.jpeg',
    'assets/images/image_2.jpeg',
    'assets/images/image_3.jpeg',
    'assets/images/image_4.png'
  ];

  final List<String> usernames = [
    'HealthLine',
    'WHO',
    'Tikinagan',
    'Roots & Water',
  ];

  final List<String> profilepath = [
    'assets/images/h.png',
    'assets/images/who.png',
    'assets/images/cyber.jpeg',
    'assets/images/7cups.jpeg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Lottie.network(
                'https://lottie.host/dd5fa0ca-e495-4d54-8302-82f9020710d3/K7NVIx2rWm.json'),
          ),
          Align(
  alignment: Alignment.center,
  child: Container(
    padding: EdgeInsets.all(16.0), // Adjust the padding as needed // Set the background color to black
    child: Text(
      'SAHARA',
      style: TextStyle(
        fontSize: 20.0, // Adjust the font size as needed
        fontWeight: FontWeight.bold, // Adjust the font weight as needed
        fontStyle: FontStyle.italic, // Set the text style to italic
        color: Colors.white, // Set the text color to white
      ),
    ),
  ),
),


          // Content
          ListView.builder(
            itemCount: imagePaths.length,
            itemBuilder: (context, index) {
              return ImagePost(
                imagePath: imagePaths[index],
                username: usernames[index],
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          // Handle bottom navigation item taps
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactList(),
              ),
            );
          }

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImagePostScreen(
                  imagePaths: imagePaths,
                  usernames: usernames,
                  profilepath: profilepath,
                ),
              ),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JournalScreen(),
              ),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Activities(),
              ),
            );
          }
        },
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Hotlines',
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
