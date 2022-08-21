import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter100/models/User.dart';

import 'student_information_page_event.dart';
import 'student_information_page_state.dart';

class StudentInformationPageBloc
    extends Bloc<StudentInformationPageEvent, StudentInformationPageState> {
  StudentInformationPageBloc(BuildContext context, String username)
      : super(StudentInformationPageState.initialState) {
    on<GetUserDataEvent>((event, emit) async {
      emit(state.clone(userName: username));
    });
    log(username.toString());

    on<SubmitUserDataEvent>((event, emit) async {
      log(event.name);
    });
  }
}
