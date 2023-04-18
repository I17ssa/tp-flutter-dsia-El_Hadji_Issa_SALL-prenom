import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todoapp/screens/menu_screen.dart';

import 'add_task.dart';
import 'home_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout>
    with SingleTickerProviderStateMixin {
  final duration = const Duration(milliseconds: 1000);
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  bool isMenuClosed = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: duration);
    _scaleAnimation =
        Tween<double>(begin: 1, end: .90).animate(_animationController);
  }

  toggleMenu() {
    setState(() {
      isMenuClosed
          ? _animationController.forward()
          : _animationController.reverse();
      isMenuClosed = !isMenuClosed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AddTask(
          toggleMenu: () {},
        ),
        MenuScreen(toggleMenu: toggleMenu),
        HomeScreen(
          scaleAnimation: _scaleAnimation,
          toggleMenu: toggleMenu,
          duration: duration,
          isMenuClosed: isMenuClosed,
        ),
      ],
    );
  }
}
