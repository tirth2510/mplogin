import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/login.dart';
import 'package:loginpage/wrapper.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signup() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text, password: password.text);
    Get.offAll(Wrapper());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'Enter Email'),
            ),
            TextField(
              controller: password,
              decoration: InputDecoration(hintText: 'Enter Password'),
            ),
            ElevatedButton(
              onPressed: () {
                signup();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 13, color: Colors.white),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor, // Background color
                onSurface: Theme.of(context)
                    .primaryColor
                    .withOpacity(0.8), // Disabled state color
              ),
            )
          ],
        ),
      ),
    );
  }
}
