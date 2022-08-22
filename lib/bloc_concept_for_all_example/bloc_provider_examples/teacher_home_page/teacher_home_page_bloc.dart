import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'teacher_home_page_event.dart';
import 'teacher_home_page_state.dart';

class TeacherHomePageBloc
    extends Bloc<TeacherHomePageEvent, TeacherHomePageState> {
  TextEditingController namecontroller = TextEditingController();

  TeacherHomePageBloc(BuildContext context)
      : super(TeacherHomePageState.initialState) {
    on<InitEvent>((event, emit) async {
      log('nirmal message');
      namecontroller.text = 'Nirmal';
    });
    add(InitEvent());

    on<SubmitUserDataEvent>((event, emit) {
      log(event.userName);
    });
  }
}
