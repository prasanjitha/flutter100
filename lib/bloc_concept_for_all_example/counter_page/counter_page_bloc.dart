import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'counter_page_event.dart';
import 'counter_page_state.dart';

class CounterPageBloc extends Bloc<CounterPageEvent, CounterPageState> {
  CounterPageBloc(BuildContext context) : super(CounterPageState.initialState) {
    on<IncrementEvent>((event, emit) async {
      emit(state.clone(number: state.number == 5 ? 0 : state.number + 1));
    });
    add(IncrementEvent());
    on<DecrementEvent>((event, emit) async {
      emit(state.clone(number: state.number - 1));
    });
    add(DecrementEvent());
    on<ResetEvent>((event, emit) async {
      emit(state.clone(number: 0));
    });
    add(ResetEvent());
  }
}
