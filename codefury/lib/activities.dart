import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(Activities());
}

class Activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health App',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 52, 48, 49),
        scaffoldBackgroundColor: const Color.fromARGB(255, 39, 37, 37),
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 42, 44, 44),
        ),
      ),
      routes: {
        '/physical_exercises': (context) => PhysicalExercisesScreen(),
        '/meditation': (context) => ActivityScreen(
              title: 'Meditation',
              content: 'Relax and clear your mind with guided meditation.',
            ),
        '/art_and_creativity': (context) => ActivityScreen(
              title: 'Art and Creativity',
              content: 'Express yourself through art and creativity.',
            ),
        '/hobby_exploration': (context) => ActivityScreen(
              title: 'Hobby Exploration',
              content: 'Discover new hobbies and interests.',
            ),
      },
      home: WellBeingOptionsScreen(),
    );
  }
}

class WellBeingOptionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Well-being Activities'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ActivityOption(
              title: 'Physical Exercises',
              description: 'Stay active with exercise routines.',
              onTap: () {
                Navigator.pushNamed(context, '/physical_exercises');
              },
            ),
            ActivityOption(
              title: 'Meditation',
              description: 'Relax and clear your mind with guided meditation.',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Meditation(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomSheet: AboutUsBottomSheet(showContent: true), // Pass showContent: true here
    );
  }
}

// Rest of the code remains the same.


// Rest of the code remains the same.

class ActivityOption extends StatelessWidget {
  final String title;
  final String description;
  final Function onTap;

  ActivityOption({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 84, 78, 78),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivityScreen extends StatelessWidget {
  final String title;
  final String content;

  ActivityScreen({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(content),
      ),
    );
  }
}

class PhysicalExercisesScreen extends StatefulWidget {
  @override
  _PhysicalExercisesScreenState createState() =>
      _PhysicalExercisesScreenState();
}

class _PhysicalExercisesScreenState extends State<PhysicalExercisesScreen> {
  int _remainingTime = 7 * 60; // 7 minutes in seconds
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Start the timer when the screen is initialized
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          // Timer is complete, you can perform any actions here
          _timer.cancel(); // Stop the timer
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Physical Exercises',
          style: TextStyle(
            fontSize: 24, // Adjust the font size
            fontWeight: FontWeight.bold, // Add bold styling
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150, // Set the desired width
              height: 150, // Set the desired height
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue, // Change the background color of the stopwatch
              ),
              child: Center(
                child: Text(
                  _formatTime(_remainingTime),
                  style: TextStyle(
                    fontSize: 36, // Adjust the font size for the stopwatch
                    color: Colors.white, // Change the text color
                    fontWeight: FontWeight.bold, // Add bold styling
                  ),
                ),
              ),
            ),
            SizedBox(height: 20), // Add spacing between the stopwatch and text
            Text(
              '7 minutes of any form of Physical Exercise improves your happiness and motivation Levels two folds.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                color: Colors.white, // Adjust the font size for the description text
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Meditation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RoundedBoxText('1. Find a quiet space.'),
            RoundedBoxText('2. Sit or lie down comfortably.'),
            RoundedBoxText('3. Close your eyes gently.'),
            RoundedBoxText('4. Focus on your breath.'),
            RoundedBoxText('5. Inhale slowly through your nose.'),
            RoundedBoxText('5. Inhale slowly through your nose.'),
            RoundedBoxText('6. Exhale gently through your mouth.'),
            RoundedBoxText('7. Let go of distractions.'),
            RoundedBoxText('8. Relax your body.'),
            RoundedBoxText('9. Be present in this moment.'),
            RoundedBoxText('10. Meditate with peace.'),
          ],
        ),
      ),
    );
  }
}

class RoundedBoxText extends StatelessWidget {
  final String text;

  RoundedBoxText(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8), // Margin for spacing between boxes
      padding: EdgeInsets.all(12), // Padding inside the box
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Border radius for a rounded box
        color: const Color.fromARGB(255, 55, 57, 59), // Background color of the box
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white, // White text color
          fontSize: 20, // Font size
          fontWeight: FontWeight.bold, // Bold text
          fontStyle: FontStyle.italic, // Italic text
        ),
      ),
    );
  }
}

class AboutUsBottomSheet extends StatelessWidget {
  final bool showContent; // Add a boolean variable to control content visibility

  AboutUsBottomSheet({required this.showContent}); // Constructor to receive the showContent value

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500), // Animation duration
      height: MediaQuery.of(context).viewInsets.bottom > 0 ? 200 : 0, // Slide up when keyboard is shown
      color: Colors.grey[900], // Background color of the bottom sheet
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'About Us',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          if (showContent) // Conditionally show the content based on showContent
            _showAboutUsContent(),
        ],
      ),
    );
  }

  Widget _showAboutUsContent() {
    return Text(
      'Our mission is to promote mental health and well-being through various activities and exercises. '
      'We are dedicated to helping you improve your mental and emotional well-being '
      'by providing you with a variety of wellness activities and resources.',
      style: TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}



