import 'package:flutter/material.dart';
import 'package:todoapp/screens/home_screen.dart';
import 'package:todoapp/screens/main_layout.dart';
import 'package:todoapp/screens/menu_screen.dart';
import 'package:todoapp/screens/add_task.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To do App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MainLayout(),
    );
  }
}
