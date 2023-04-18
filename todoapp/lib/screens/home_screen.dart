import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:todoapp/common/task_category.dart';
import 'package:todoapp/commons/common.dart';
import 'package:todoapp/commons/task_item.dart';
import 'package:todoapp/models/task.dart';
import 'package:todoapp/screens/add_task.dart';
import '../common/slider_item.dart';

class HomeScreen extends StatefulWidget {
  final Animation<double> scaleAnimation;
  final VoidCallback toggleMenu;
  final Duration duration;
  final bool isMenuClosed;
  const HomeScreen(
      {super.key,
      required this.scaleAnimation,
      required this.toggleMenu,
      required this.duration,
      required this.isMenuClosed});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    List<Task> tasksFromServer = [
      Task(
        title: "Daily meeting with team",
        isDone: false,
        category: TaskCategory.business,
      ),
      Task(
        title: "Learn programming flutter",
        isDone: false,
        category: TaskCategory.business,
      ),
      Task(
        title: "Pay rent",
        isDone: true,
        category: TaskCategory.business,
      ),
      Task(
        title: "Do Sport",
        isDone: false,
        category: TaskCategory.business,
      ),
      Task(
        title: "make diner",
        isDone: false,
        category: TaskCategory.business,
      ),
    ];

    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: widget.isMenuClosed ? 0 : screenwidth * .7,
      right: widget.isMenuClosed ? 0 : -screenwidth * .7,
      duration: widget.duration,
      child: ScaleTransition(
        scale: widget.scaleAnimation,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: secondBackground,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: widget.toggleMenu,
                        child: Icon(
                          Icons.menu,
                          color: Colors.white.withOpacity(0.4),
                          size: 60.0,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white.withOpacity(0.4),
                            size: 30.0,
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Icon(
                            Icons.notifications_outlined,
                            color: Colors.white.withOpacity(0.4),
                            size: 30.0,
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    "What's up Wi ! ",
                    style: TextStyle(color: Colors.white, fontSize: 35.0),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    "Categories".toUpperCase(),
                    style: TextStyle(color: transparentWhite, fontSize: 16.0),
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    scrollDirection: Axis.horizontal,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      SliderItem(
                        category: TaskCategory.business,
                        taskNumber: 40,
                      ),
                      SliderItem(
                          category: TaskCategory.personal, taskNumber: 18)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(
                    "Today's tasks".toUpperCase(),
                    style: TextStyle(
                        color: secondTranslucicidWhite, fontSize: 14.0),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddTask(
                          toggleMenu: () {},
                        )),
              );
            },
            backgroundColor: businessIndicator,
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }
}
