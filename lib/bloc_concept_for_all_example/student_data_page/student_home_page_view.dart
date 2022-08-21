import 'package:flutter/material.dart';
import 'package:flutter100/bloc_concept_for_all_example/student_data_page/student_home_page_bloc.dart';
import 'package:flutter100/bloc_concept_for_all_example/student_data_page/student_home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'student_home_page_event.dart';

class StudentPageView extends StatefulWidget {
  const StudentPageView({Key? key}) : super(key: key);

  @override
  _StudentPageViewState createState() => _StudentPageViewState();
}

class _StudentPageViewState extends State<StudentPageView> {
  @override
  void initState() {
    super.initState();
    StudentPageBloc bloc = BlocProvider.of<StudentPageBloc>(context);
    bloc.add(LoadUserData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(child: BlocBuilder<StudentPageBloc, StudentPageState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          return ListView.builder(
            itemCount: state.users.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    state.users[index].image.toString(),
                    height: 40.0,
                    width: 40.0,
                  ),
                ),
                title: Text(state.users[index].email.toString()),
                onTap: () {
                  print(state.users[index].toJson());
                },
              );
            },
          );
        },
      )),
    );
  }
}
