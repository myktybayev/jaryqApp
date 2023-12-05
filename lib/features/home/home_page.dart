import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final UserCredential? userCredential;

  const HomePage({super.key, this.userCredential});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserCredential? userCredential;

  @override
  void initState() {
    userCredential = widget.userCredential;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.greenAccent,
          ),
          child: Center(child: Icon(Icons.filter)),
        ),
      ),
    );
  }
}
