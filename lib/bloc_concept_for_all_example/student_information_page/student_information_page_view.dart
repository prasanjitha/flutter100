// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter100/bloc_concept_for_all_example/student_information_page/student_information_page_bloc.dart';
import 'package:flutter100/bloc_concept_for_all_example/student_information_page/student_information_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'student_information_page_event.dart';

class StudentInformationPageView extends StatefulWidget {
  const StudentInformationPageView({Key? key}) : super(key: key);

  @override
  _StudentInformationPageViewState createState() =>
      _StudentInformationPageViewState();
}

class _StudentInformationPageViewState
    extends State<StudentInformationPageView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    String text = 'kamal';
    StudentInformationPageBloc bloc =
        BlocProvider.of<StudentInformationPageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            BlocBuilder<StudentInformationPageBloc,
                StudentInformationPageState>(
              builder: (context, state) {
                return Text(state.userName.toString());
              },
            ),
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: bloc.controller,
                decoration: const InputDecoration(hintText: 'Enter Name'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: TextFormField(
                  onSaved: (newValue) {
                    text = newValue!;
                  },
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'name is required';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  log(text);
                }
                bloc.add(SubmitUserDataEvent(name: bloc.controller.text));
              },
              child: const Text('Submit'),
            ),
          ],
        )),
      ),
    );
  }
}
