// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter100/bloc_concept_for_all_example/stream_builder_example/stream_builder_example_page_bloc.dart';
import 'package:flutter100/bloc_concept_for_all_example/stream_builder_example/stream_builder_example_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'stream_builder_example_page_event.dart';

class StreamBuilderExamplePageView extends StatefulWidget {
  const StreamBuilderExamplePageView({Key? key}) : super(key: key);

  @override
  _StreamBuilderExamplePageViewState createState() =>
      _StreamBuilderExamplePageViewState();
}

class _StreamBuilderExamplePageViewState
    extends State<StreamBuilderExamplePageView> {
  @override
  void initState() {
    super.initState();
    StreamBuilderExamplePageBloc bloc =
        BlocProvider.of<StreamBuilderExamplePageBloc>(context);
    bloc.add(LoadDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 100.0,
          ),
          // RaisedButton(onPressed: () {
          //   bloc.add(LoadDataEvent());
          // }),
          BlocBuilder<StreamBuilderExamplePageBloc,
              StreamBuilderExamplePageState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return Text(state.number.toString());
            },
          ),
        ],
      )),
    );
  }
}
