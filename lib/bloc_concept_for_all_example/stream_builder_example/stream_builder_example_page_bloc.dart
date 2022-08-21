import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'stream_builder_example_page_event.dart';
import 'stream_builder_example_page_state.dart';

class StreamBuilderExamplePageBloc
    extends Bloc<StreamBuilderExamplePageEvent, StreamBuilderExamplePageState> {
  StreamBuilderExamplePageBloc(BuildContext context)
      : super(StreamBuilderExamplePageState.initialState) {
    on<LoadDataEvent>((event, emit) async {
      emit(state.clone(isLoading: true));
      for (var i = 0; i < 10; i++) {
        await Future.delayed(const Duration(seconds: 2));
        emit(state.clone(number: i, isLoading: false));
      }
    });
  }
}
