import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter100/models/User.dart';

import 'student_information_page_event.dart';
import 'student_information_page_state.dart';

class StudentInformationPageBloc
    extends Bloc<StudentInformationPageEvent, StudentInformationPageState> {
  final TextEditingController controller = TextEditingController();
  StudentInformationPageBloc(BuildContext context, String username)
      : super(StudentInformationPageState.initialState) {
    on<GetUserDataEvent>((event, emit) async {
      controller.text = username;
      emit(state.clone(userName: username, init: true));
    });
    add(GetUserDataEvent());

    on<SubmitUserDataEvent>((event, emit) async {
      log('hello ' + event.name);
    });
  }
}
