import 'package:flutter/material.dart';
import 'package:flutter100/bloc_concept_for_all_example/bloc_provider_examples/subject_details_page/subject_details_page_bloc.dart';
import 'package:flutter100/bloc_concept_for_all_example/bloc_provider_examples/subject_details_page/subject_details_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectDetailsPageView extends StatefulWidget {
  const SubjectDetailsPageView({Key? key}) : super(key: key);

  @override
  _SubjectDetailsPageViewState createState() => _SubjectDetailsPageViewState();
}

class _SubjectDetailsPageViewState extends State<SubjectDetailsPageView> {
  @override
  Widget build(BuildContext context) {
    SubjectDetailsPageBloc subjectBloc =
        BlocProvider.of<SubjectDetailsPageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
          child: BlocBuilder<SubjectDetailsPageBloc, SubjectDetailsPageState>(
        buildWhen: (previous, current) =>
            previous.subjectName != current.subjectName ||
            previous.isLoading != current.isLoading,
        builder: (context, state) {
          if (state.isLoading) {
            return const CircularProgressIndicator.adaptive();
          }
          return Text(state.subjectName);
        },
      )),
    );
  }
}
