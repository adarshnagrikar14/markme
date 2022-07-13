// ignore_for_file: file_names, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markme/calender.dart';
import 'package:markme/profile.dart';
import 'package:markme/scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:markme/qr_scanner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> doneList = [];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.blue, // status bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  @override
  void dispose() {
    SystemChrome.restoreSystemUIOverlays();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1.0,
        title: Text(
          "MarkMe",
          style: GoogleFonts.rubik(
            textStyle: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Tooltip(
              message: "Help",
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(
                  Icons.help,
                  size: 27.0,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const ScannerScreen(), // yaha change hai!!
                  ),
                );

                if (result != null) {
                  print(result);

                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: const Text("Confirmation"),
                        content: const Text(
                            "Are You sure You want to Mark the Attendance?"),
                        actions: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: (() => Navigator.pop(context)),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Cancel",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () => result != "Hello World"
                                      ? addSnackbar(context)
                                      : addSF(),
                                  child: const Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        "Ok",
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Image.asset("assets/images/img1.png"),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Calender(),
                  ),
                );
              },
              child: Image.asset("assets/images/img2.png"),
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: Image.asset("assets/images/img3.png"),
            ),
          ),
        ],
      ),
    );
  }

  addSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> doneList1 = prefs.getStringList('dateData') ?? [];
    doneList1.add("01");

    prefs.setStringList('dateData', doneList1);

    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  addSnackbar(BuildContext context) {
    Navigator.pop(context);
  }
}
