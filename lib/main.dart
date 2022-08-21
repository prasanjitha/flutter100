import 'package:flutter/material.dart';
import 'package:flutter100/bloc_concept_for_all_example/stream_builder_example/stream_builder_example_page_provider.dart';
import 'bloc_concept_for_all_example/student_data_page/student_home_page_provider.dart';
import 'views/future_api_example.dart';
import 'views/stream_data_example_one.dart';
import 'views/stream_data_example_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StudentPageProvider(),
    );
  }
}
