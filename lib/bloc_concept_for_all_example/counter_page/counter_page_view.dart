import 'package:flutter/material.dart';
import 'package:flutter100/bloc_concept_for_all_example/counter_page/counter_page_bloc.dart';
import 'package:flutter100/bloc_concept_for_all_example/counter_page/counter_page_event.dart';
import 'package:flutter100/bloc_concept_for_all_example/counter_page/counter_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPageView extends StatefulWidget {
  const CounterPageView({Key? key}) : super(key: key);

  @override
  _CounterPageViewState createState() => _CounterPageViewState();
}

class _CounterPageViewState extends State<CounterPageView> {
  @override
  Widget build(BuildContext context) {
    CounterPageBloc bloc = BlocProvider.of<CounterPageBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 200.0,
          ),
          BlocBuilder<CounterPageBloc, CounterPageState>(
            buildWhen: (previous, current) => previous.number != current.number,
            builder: (context, state) {
              return Text(state.number.toString());
            },
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    bloc.add(IncrementEvent());
                  },
                  child: const Icon(Icons.add)),
              ElevatedButton(
                  onPressed: () {
                    bloc.add(ResetEvent());
                  },
                  child: const Icon(Icons.baby_changing_station)),
              ElevatedButton(
                  onPressed: () {
                    bloc.add(DecrementEvent());
                  },
                  child: const Icon(Icons.remove)),
            ],
          )
        ],
      )),
    );
  }
}
