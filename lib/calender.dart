// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calender extends StatefulWidget {
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  late List<String> doneList = ["", "", ""];

  static var androidVersionNames = [
    {
      'date': '01',
      'done': true,
    },
    {
      'date': '02',
      'done': true,
    },
    {
      'date': '03',
      'done': true,
    },
    {
      'date': '04',
      'done': true,
    },
    {
      'date': '05',
      'done': true,
    },
    {
      'date': '06',
      'done': true,
    },
    {
      'date': '07',
      'done': true,
    },
    {
      'date': '08',
      'done': true,
    },
    {
      'date': '09',
      'done': true,
    },
    {
      'date': '10',
      'done': true,
    },
    {
      'date': '11',
      'done': true,
    },
    {
      'date': '12',
      'done': true,
    },
    {
      'date': '13',
      'done': true,
    },
    {
      'date': '14',
      'done': true,
    },
    {
      'date': '15',
      'done': true,
    },
    {
      'date': '16',
      'done': true,
    },
    {
      'date': '17',
      'done': true,
    },
    {
      'date': '18',
      'done': true,
    },
    {
      'date': '19',
      'done': true,
    },
    {
      'date': '20',
      'done': true,
    },
    {
      'date': '21',
      'done': true,
    },
    {
      'date': '22',
      'done': true,
    },
    {
      'date': '23',
      'done': true,
    },
    {
      'date': '24',
      'done': true,
    },
    {
      'date': '25',
      'done': true,
    },
    {
      'date': '26',
      'done': true,
    },
    {
      'date': '27',
      'done': true,
    },
    {
      'date': '28',
      'done': true,
    },
    {
      'date': '29',
      'done': true,
    },
    {
      'date': '30',
      'done': true,
    },
  ];

  @override
  void initState() {
    super.initState();
    getLlist();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Days Marked",
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.builder(
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Chip(
                  padding: const EdgeInsets.all(10),
                  backgroundColor: Colors.blue.shade300,
                  avatar: getDone()[position] == "true"
                      ? const Icon(
                          Icons.done,
                          color: Color.fromARGB(255, 17, 159, 22),
                        )
                      : null,
                  label: Text(
                    getName()[position],
                    // getList().toString(),
                    style: const TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: doneList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4),
        ),
      ),
    );
  }

  List<String> getName() {
    List<String> namesList =
        androidVersionNames.map((e) => e["date"].toString()).toList();
    return namesList;
  }

  List<String> getDone() {
    List<String> doneList =
        androidVersionNames.map((e) => e["done"].toString()).toList();
    return doneList;
  }

  void getLlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      doneList = prefs.getStringList('dateData') ?? [];
    });
  }
}
