import 'package:flutter/material.dart';
import 'fitness_goal_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Muscle Monster',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const FitnessGoalScreen(),
    );
  }
}
