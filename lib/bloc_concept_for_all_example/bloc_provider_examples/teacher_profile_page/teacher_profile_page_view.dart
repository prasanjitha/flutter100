import 'package:flutter/material.dart';
import 'package:flutter100/bloc_concept_for_all_example/bloc_provider_examples/subject_details_page/subject_details_page_bloc.dart';
import 'package:flutter100/bloc_concept_for_all_example/bloc_provider_examples/subject_details_page/subject_details_page_provider.dart';
import 'package:flutter100/bloc_concept_for_all_example/bloc_provider_examples/teacher_home_page/teacher_home_page_bloc.dart';
import 'package:flutter100/bloc_concept_for_all_example/bloc_provider_examples/teacher_profile_page/teacher_profile_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../subject_details_page/subject_details_page_event.dart';
import '../teacher_home_page/teacher_home_page_event.dart';
import 'teacher_profile_page_event.dart';

class TeacherProfilePageView extends StatefulWidget {
  const TeacherProfilePageView({Key? key}) : super(key: key);

  @override
  _TeacherProfilePageViewState createState() => _TeacherProfilePageViewState();
}

class _TeacherProfilePageViewState extends State<TeacherProfilePageView> {
  @override
  Widget build(BuildContext context) {
    TeacherProfilePageBloc teacherProfileBloc =
        BlocProvider.of<TeacherProfilePageBloc>(context);
    TeacherHomePageBloc bloc = BlocProvider.of<TeacherHomePageBloc>(context);
    SubjectDetailsPageBloc subjectBloc =
        BlocProvider.of<SubjectDetailsPageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher Profile"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 100.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: bloc.namecontroller,
                decoration: const InputDecoration(hintText: 'Enter Name'),
              ),
            ),
            const SizedBox(
              height: 100.0,
            ),
            ElevatedButton(
              onPressed: () {
                bloc.add(
                    SubmitUserDataEvent(userName: bloc.namecontroller.text));
              },
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 100.0,
            ),
            ElevatedButton(
              onPressed: () {
                teacherProfileBloc.add(CallOwnEvent());
              },
              child: const Text('Call Own Event'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                // subjectBloc.add(AddSubjectEvent(subjectName: 'Maths'));
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => SubjectDetailsPageProvider()),
                  ),
                );
              },
              child: const Text('view my subject'),
            ),
          ],
        )),
      ),
    );
  }
}
