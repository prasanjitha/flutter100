// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter100/bloc_concept_for_all_example/user_input_page/user_input_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'user_input_page_bloc.dart';

class UserInputPageView extends StatefulWidget {
  const UserInputPageView({Key? key}) : super(key: key);

  @override
  _UserInputPageViewState createState() => _UserInputPageViewState();
}

class _UserInputPageViewState extends State<UserInputPageView> {
  @override
  Widget build(BuildContext context) {
    UserInputPageBloc bloc = BlocProvider.of<UserInputPageBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Data"),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 100.0,
          ),
          const Text("Home Page View"),
          const SizedBox(
            height: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: bloc.controller,
              decoration: const InputDecoration(hintText: 'Enter Name'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                log(bloc.controller.text);
              },
              child: const Text('Submit'))
        ],
      )),
    );
  }
}
