import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/wrapper.dart';
import 'package:get/get.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {

  TextEditingController email = TextEditingController();

  reset()async{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forgot Password"),),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: email,
              decoration: InputDecoration(hintText: 'Enter Email'),
            ),
            ElevatedButton(
  onPressed: reset,
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0),
    child: Text("Send link", style: TextStyle(fontSize: 13, color: Colors.white)),
  ),
  style: ElevatedButton.styleFrom(
    primary: Theme.of(context).primaryColor, // Background color
    onSurface: Theme.of(context).primaryColor.withOpacity(0.8), // Color when button is pressed
  ),
)
          ],
        ),
      ),
    );
  }
}