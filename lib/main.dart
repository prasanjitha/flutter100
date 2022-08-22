import 'package:flutter/material.dart';
import 'package:flutter100/bloc_concept_for_all_example/bloc_provider_examples/subject_details_page/subject_details_page_bloc.dart';
import 'package:flutter100/bloc_concept_for_all_example/bloc_provider_examples/teacher_home_page/teacher_home_page_bloc.dart';
import 'package:flutter100/bloc_concept_for_all_example/stream_builder_example/stream_builder_example_page_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_concept_for_all_example/bloc_provider_examples/students_search_page/student_search_page_provider.dart';
import 'bloc_concept_for_all_example/bloc_provider_examples/subject_details_page/search_screen.dart';
import 'bloc_concept_for_all_example/bloc_provider_examples/teacher_profile_page/teacher_profile_page_provider.dart';
import 'bloc_concept_for_all_example/counter_page/counter_page_provider.dart';
import 'bloc_concept_for_all_example/student_data_page/student_home_page_provider.dart';
import 'bloc_concept_for_all_example/student_information_page/student_information_page_provider.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TeacherHomePageBloc(context),
        ),
        BlocProvider(
          create: (context) => SubjectDetailsPageBloc(context),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StudentSearchPageProvider(),
      ),
    );
  }
}
