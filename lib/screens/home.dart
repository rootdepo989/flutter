import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todosapp/constants/colors.dart';
import 'package:todosapp/data/todos.dart';
import 'package:todosapp/screens/addNewTask.dart';

import '../components/todoItem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final todoCount = todos.length;
  @override
  Widget build(BuildContext context) {
    // variables....
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            // appBar: AppBar(
            //   title: const Text("Todos app"),
            // ),
            backgroundColor: HexColor(bgLight),
            body: buildBody(context, deviceWidth, deviceHeight)),
      ),
    );
  }

  // buildBody method.....      get values with parametr
  Widget buildBody(context, deviceWidth, deviceHeight) {
    // ignore: sized_box_for_whitespace
    return Column(
      children: [
        Container(
          // color: Colors.purple,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("lib/assets/images/header.png"),
            fit: BoxFit.cover,
          )),
          width: deviceWidth,
          height: deviceHeight / 3,
          child: const Column(children: [
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "12.01.2023",
                  style: TextStyle(color: Colors.white),
                )),
            Padding(
                padding: EdgeInsets.all(20),
                child: Text("Todos app",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24))),
          ]),
        ),
        // TOP COLUMN....
        Expanded(
          child: SingleChildScrollView(
              child: ListView.builder(
                  itemCount: todoCount,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TodoItem(title: todos[index]);
                  })),
        ),

        // COMPLETED TEXT...
        const Align(alignment: Alignment.topLeft, child: Text("Completed")),

        // BOTTOM COLUMN....
        Expanded(
          child: SingleChildScrollView(
              child: ListView.builder(
                  itemCount: todoCount,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TodoItem(title: todos[index]);
                  })),
        ),

        // BUTTON
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AddNewTaskScreen()));
            },
            child: const Text("Add todo"))
      ],
    );
  }
}
