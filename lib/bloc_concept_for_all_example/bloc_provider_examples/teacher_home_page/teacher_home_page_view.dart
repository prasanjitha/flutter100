import 'package:flutter/material.dart';

class TeacherHomePageView extends StatefulWidget {
  const TeacherHomePageView({Key? key}) : super(key: key);

  @override
  _TeacherHomePageViewState createState() => _TeacherHomePageViewState();
}

class _TeacherHomePageViewState extends State<TeacherHomePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Center(child: Text("Home Page View")),
    );
  }
}
