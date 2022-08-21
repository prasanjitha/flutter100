import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'future_api_example_page_event.dart';
import 'future_api_example_page_state.dart';

class FutureApiExamplePageBloc
    extends Bloc<FutureApiExamplePageEvent, FutureApiExamplePageState> {
  FutureApiExamplePageBloc(BuildContext context)
      : super(FutureApiExamplePageState.initialState) {
    on<LoadEmailEvent>((event, emit) async {
      emit(state.clone(isLoading: true));

      String email = await Future.delayed(const Duration(seconds: 2), () {
        return 'nirmalpra12@gmail.com';
      });
      emit(state.clone(email: email, isLoading: false));
    });
  }
}
