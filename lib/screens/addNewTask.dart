import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todosapp/constants/colors.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // variables....
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(bgLight),
        body: buildBody(deviceWidth, deviceHeight, context),
      ),
    );
  }

// sending walues with parametr....
  Widget buildBody(deviceWidth, deviceHeight, context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: deviceWidth,
            height: deviceHeight / 10,
            color: Colors.purple,
            child: Row(children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  size: 36,
                ),
                color: Colors.white,
              ),
              const Expanded(
                  child: Text(
                "Add new Task",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 21),
              ))
            ]),
          ),
          const Text("Task title"),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: TextField(
                decoration:
                    InputDecoration(filled: true, fillColor: Colors.white)),
          ),
          Row(
            children: [
              const Text("Category"),
              GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      duration: Duration(microseconds: 400),
                      content: Text("Selected category")));
                },
                child: Image.asset(
                  "lib/assets/images/weightlifter.png",
                  width: 50,
                  height: 50,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Expanded(
                child: Column(children: [
                  Text("Date"),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: TextField(
                        decoration: InputDecoration(
                            filled: true, fillColor: Colors.white),
                      )),
                ]),
              ),
              const Expanded(
                child: Column(children: [
                  Text("Time"),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true, fillColor: Colors.white),
                    ),
                  ),
                ]),
              ),
              const Text("Notes"),
              const SizedBox(
                height: 300,
                child: TextField(
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                      filled: true, fillColor: Colors.white, isDense: true),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Save"))
            ],
          )
        ],
      ),
    );
  }
}
