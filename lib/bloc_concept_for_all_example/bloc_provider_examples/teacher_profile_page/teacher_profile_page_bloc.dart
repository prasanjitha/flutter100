import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'teacher_profile_page_event.dart';
import 'teacher_profile_page_state.dart';

class TeacherProfilePageBloc
    extends Bloc<TeacherProfilePageEvent, TeacherProfilePageState> {
  TextEditingController controller = TextEditingController();
  TeacherProfilePageBloc(BuildContext context)
      : super(TeacherProfilePageState.initialState) {
    on<InitEvent>((event, emit) async {
      log('message');
      controller.text = 'Nimal';
    });
    add(InitEvent());
    on<CallOwnEvent>((event, emit) async {
      log('Call own event bloc');
    });
  }
}
