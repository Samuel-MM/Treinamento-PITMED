import 'package:first_project/views/first-screen.dart';
import 'package:first_project/views/second-screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final firstScreen = '/';
  final secondScreen = '/second';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Primeiro App',
      initialRoute: firstScreen,
      routes: {
        firstScreen: (context) => const FirstScreen(),
        secondScreen: (context) => const SecondScreen()
      },
    );
  }
}
