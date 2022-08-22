import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'subject_details_page_event.dart';
import 'subject_details_page_state.dart';

class SubjectDetailsPageBloc
    extends Bloc<SubjectDetailsPageEvent, SubjectDetailsPageState> {
  SubjectDetailsPageBloc(BuildContext context)
      : super(SubjectDetailsPageState.initialState) {
    on<AddSubjectEvent>((event, emit) async {
      emit(state.clone(isLoading: true));
      await Future.delayed(const Duration(seconds: 10));
      emit(state.clone(subjectName: 'Maths', isLoading: false));
    });
    add(AddSubjectEvent());
  }
}
