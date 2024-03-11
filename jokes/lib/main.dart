import 'package:flutter/material.dart';
import 'package:jokes/data_source.dart';
import 'package:jokes/joke_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider(create: (context) => DataSource(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meow Jokes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const JokesApp(),
    );
  }
}
class JokesApp extends StatelessWidget {
  const JokesApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Meow Jokes",
      home: JokePage(),
    );
  }
}

