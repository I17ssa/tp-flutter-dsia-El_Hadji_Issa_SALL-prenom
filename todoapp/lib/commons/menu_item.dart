import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todoapp/commons/common.dart';

class MyMenuItem extends StatelessWidget {
  const MyMenuItem({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: transparentWhite,
            size: 30.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 22.0),
            ),
          ),

          //const Padding(padding: EdgeInsets.only(left: 20.0))
        ],
      ),
    );
  }
}
