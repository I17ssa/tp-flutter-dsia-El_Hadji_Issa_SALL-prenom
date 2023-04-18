import 'package:flutter/material.dart';
import 'package:todoapp/commons/common.dart';

class AddTask extends StatefulWidget {
  final VoidCallback toggleMenu;

  const AddTask({super.key, required this.toggleMenu});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBackground,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: Colors.white,
                ),
                shape: BoxShape.circle,
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 5.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Text(
            'Ajoutez une tache',
            style: TextStyle(
                color: Colors.white,
                fontSize: 35.0,
                fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    labelText: 'Categorie',
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    // hintText: 'Categorie',
                    hintStyle: TextStyle(color: Colors.white))),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelText: 'Titre',
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  // hintText: 'Titre',
                  hintStyle: TextStyle(color: Colors.white)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(child: Text('Ajouter'), onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
