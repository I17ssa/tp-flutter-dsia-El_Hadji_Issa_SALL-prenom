import 'package:flutter/material.dart';
import 'package:todoapp/common/task_category.dart';
import 'package:todoapp/commons/common.dart';

class SliderItem extends StatefulWidget {
  final int taskNumber;
  final TaskCategory category;
  const SliderItem(
      {super.key, required this.taskNumber, required this.category});

  @override
  State<SliderItem> createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: screenWidth * .5,
      decoration: BoxDecoration(
        color: primaryBackground,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: kElevationToShadow[8],
      ),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                "${widget.taskNumber} tasks",
                style: TextStyle(
                  color: secondTranslucicidWhite,
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                  widget.category == TaskCategory.business
                      ? "Business"
                      : "Perso",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  )),
              const SizedBox(
                height: 20,
              ),
              LinearProgressIndicator(
                backgroundColor: secondTranslucicidWhite,
                value: .6,
                color: widget.category == TaskCategory.business
                    ? businessIndicator
                    : personalIndicator,
              )
            ],
          )),
    );
  }
}
