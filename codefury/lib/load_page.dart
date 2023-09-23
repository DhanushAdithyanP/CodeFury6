import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //creating a list of quotes
    var quoteList = [
      "All limitations are self-imposed. \n– Oliver Wendell Holmes",
      "Tough times never last but tough people do. \n– Robert H. Schiuller",
      "Problems are not stop signs, they are guidelines.\n – Robert H. Schiuller",
      "One day the people that don’t even believe in you will tell everyone how they met you. \n– Johnny Depp",
      "If I’m gonna tell a real story, I’m gonna start with my name. \n– Kendrick Lamar",
      "If you tell the truth you don’t have to remember anything.\n – Mark Twain",
      "Have enough courage to start and enough heart to finish.\n – Jessica N. S. Yourko",
      "Hate comes from intimidation, love comes from appreciation.\n – Tyga",
      "I could agree with you but then we’d both be wrong.\n – Harvey Specter",
      "Oh, the things you can find, if you don’t stay behind. \n– Dr. Seuss",
      "Simplicity is the ultimate sophistication.\n – Leonardo da Vinci",
      "Whatever you do, do it well. \n– Walt Disney",
      "What we think, we become. \n– Buddha"
    ];

    //For random selection of quotes from our list
    Random index = new Random();

    //Gesture detector that will handle the navigation to the homescreen on tap
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'homescreen'),
      child: Scaffold(
        backgroundColor: Colors.black38,

        //For the shimmer effect
        body: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white,
          period: Duration(seconds: 8),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),

            // Stack of two components : quote and "Tap to Enter"
            child: Stack(
              children: [
                Center(
                  child: Text(
                    quoteList[index.nextInt(quoteList.length)],
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: MediaQuery.of(context).size.width / 2.75,
                  child: Text(
                    "Tap to Enter",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}