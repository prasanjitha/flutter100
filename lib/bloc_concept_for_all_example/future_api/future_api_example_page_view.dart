import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'future_api_example_page_bloc.dart';
import 'future_api_example_page_event.dart';
import 'future_api_example_page_state.dart';

class FutureApiExamplePageView extends StatefulWidget {
  const FutureApiExamplePageView({Key? key}) : super(key: key);

  @override
  _FutureApiExamplePageViewState createState() =>
      _FutureApiExamplePageViewState();
}

class _FutureApiExamplePageViewState extends State<FutureApiExamplePageView> {
  @override
  Widget build(BuildContext context) {
    FutureApiExamplePageBloc bloc =
        BlocProvider.of<FutureApiExamplePageBloc>(context);
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
          BlocBuilder<FutureApiExamplePageBloc, FutureApiExamplePageState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return Text(state.email);
            },
          ),
          const SizedBox(
            height: 100.0,
          ),
          RaisedButton(
            onPressed: () {
              bloc.add(LoadEmailEvent());
            },
            child: Text('Load Email'),
          ),
        ],
      )),
    );
  }
}
