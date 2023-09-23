import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mental Health App',
      theme: ThemeData(
        primaryColor: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.pink,
        ),
      ),
      home: WellBeingOptionsScreen(),
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
        '/journaling': (context) => ActivityScreen(
              title: 'Journaling',
              content: 'Reflect on your thoughts and experiences.',
            ),
        '/hobby_exploration': (context) => ActivityScreen(
              title: 'Hobby Exploration',
              content: 'Discover new hobbies and interests.',
            ),
      },
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
      body: CustomPaint(
        painter: BackgroundPainter(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ActivityOption(
                title: 'Physical Exercises',
                description: 'Stay active with exercise routines.',
                icon: Icons.directions_run,
                onTap: () {
                  Navigator.pushNamed(context, '/physical_exercises');
                },
              ),
              ActivityOption(
                title: 'Meditation',
                description: 'Relax and clear your mind with guided meditation.',
                icon: Icons.self_improvement,
                onTap: () {
                  Navigator.pushNamed(context, '/meditation');
                },
              ),
              ActivityOption(
                title: 'Art and Creativity',
                description: 'Express yourself through art and creativity.',
                icon: Icons.palette,
                onTap: () {
                  Navigator.pushNamed(context, '/art_and_creativity');
                },
              ),
              ActivityOption(
                title: 'Journaling',
                description: 'Reflect on your thoughts and experiences.',
                icon: Icons.note,
                onTap: () {
                  Navigator.pushNamed(context, '/journaling');
                },
              ),
              ActivityOption(
                title: 'Hobby Exploration',
                description: 'Discover new hobbies and interests.',
                icon: Icons.explore,
                onTap: () {
                  Navigator.pushNamed(context, '/hobby_exploration');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow.shade200 // Yellow background color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, 0)
      ..lineTo(0, size.height * 0.3)
      ..quadraticBezierTo(
          size.width * 0.5, size.height * 0.7, size.width, size.height * 0.3)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);

    final brownPaint = Paint()
      ..color = Colors.brown.shade300 // Brown background color
      ..style = PaintingStyle.fill;

    final brownPath = Path()
      ..lineTo(0, size.height * 0.3)
      ..quadraticBezierTo(
          size.width * 0.5, size.height * 0.4, size.width, size.height * 0.3)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(brownPath, brownPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class ActivityOption extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Function onTap;

  ActivityOption({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 48, color: Colors.pink),
      title: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.black),
      ),
      subtitle: Text(
        description,
        style: TextStyle(color: Colors.grey),
      ),
      onTap: () {
        onTap();
      },
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

class PhysicalExercisesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Physical Exercises'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExerciseOption(
              title: 'Walking',
              description: 'Stay active with walking exercises.',
              onTap: () {
                // Implement navigation or action for walking
              },
            ),
            ExerciseOption(
              title: 'Yoga',
              description: 'Practice yoga for physical and mental well-being.',
              onTap: () {
                // Implement navigation or action for yoga
              },
            ),
            ExerciseOption(
              title: 'Gym or Aerobic Exercise',
              description: 'Hit the gym or engage in aerobic workouts.',
              onTap: () {
                // Implement navigation or action for gym/aerobic exercise
              },
            ),
            ExerciseOption(
              title: 'Sports',
              description: 'Participate in sports activities.',
              onTap: () {
                // Implement navigation or action for sports
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseOption extends StatelessWidget {
  final String title;
  final String description;
  final Function onTap;

  ExerciseOption({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(description),
      onTap: () {
        onTap();
      },
    );
  }
}