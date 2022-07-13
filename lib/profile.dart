import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _userName = "";
  late String _userEmail = "";

  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      _userName = user!.displayName!;
      _userEmail = user.email!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Username",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                _userName,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Text(
                "Email",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  _userEmail,
                  style: const TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text("Markme ©"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
