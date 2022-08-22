import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'user_input_page_event.dart';
import 'user_input_page_state.dart';

class UserInputPageBloc extends Bloc<UserInputPageEvent, UserInputPageState> {
  TextEditingController controller = TextEditingController();
  UserInputPageBloc(BuildContext context)
      : super(UserInputPageState.initialState) {
    on<InitEvent>((event, emit) async {
      controller.text = 'kamal';
      log('message');
    });
    add(InitEvent());
  }
}
