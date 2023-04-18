import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todoapp/common/common.dart';
import 'package:todoapp/commons/common.dart';
import 'package:todoapp/commons/menu_item.dart';

class MenuScreen extends StatefulWidget {
  final VoidCallback toggleMenu;
  const MenuScreen({super.key, required this.toggleMenu});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    double deviceScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: primaryBackground,
      body: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 100.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: widget.toggleMenu,
                  borderRadius: BorderRadius.circular(25.0),
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.5,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 5.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: deviceScreenWidth * .38,
                ),
              ],
            ),
            // User avatar
            Container(
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2), shape: BoxShape.circle),
              child: Container(
                padding: const EdgeInsets.all(4.0),
                decoration: const BoxDecoration(
                    color: primaryBackground, shape: BoxShape.circle),
                child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/avatar.jpeg"),
                  radius: 45.0,
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            // Username
            const Text(
              "Olivia \n Mitchel",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            const MyMenuItem(
              title: "Template",
              icon: Icons.collections_bookmark_outlined,
            ),
            const MyMenuItem(
              title: "Category",
              icon: Icons.grid_view_outlined,
            ),
            const MyMenuItem(
              title: "Analytic",
              icon: Icons.pie_chart_outline_outlined,
            ),
            Expanded(
              child: Container(),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Desing by \n",
                  style: TextStyle(color: transparentWhite, fontSize: 14.0)),
              const TextSpan(
                  text: "DELISSOS",
                  style: TextStyle(color: Colors.white, fontSize: 22.0)),
            ])),
            const SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
