import 'package:flutter/material.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // variables....
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: buildBody(deviceWidth, deviceHeight, context),
      ),
    );
  }

// sending walues with parametr....
  Widget buildBody(deviceWidth, deviceHeight, context) {
    return Column(
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
        )
      ],
    );
  }
}
