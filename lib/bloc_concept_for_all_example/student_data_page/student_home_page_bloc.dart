import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter100/models/User.dart';
import 'student_home_page_event.dart';
import 'student_home_page_state.dart';
import 'package:http/http.dart' as http;

class StudentPageBloc extends Bloc<StudentPageEvent, StudentPageState> {
  StudentPageBloc(BuildContext context) : super(StudentPageState.initialState) {
    on<LoadUserData>((event, emit) async {
      emit(state.clone(isLoading: true));

      List<User> users = await getUsers();
      emit(state.clone(users: users, isLoading: false));
    });
  }

  Future<List<User>> getUsers() async {
    log("hello");
    var url = Uri.parse('https://randomuser.me/api/?results=20');
    late http.Response response;
    List<User> users = [];
    try {
      response = await http.get(url);
      if (response.statusCode == 200) {
        Map peopleData = jsonDecode(response.body);
        List<dynamic> peoples = peopleData["results"];
        for (var item in peoples) {
          var email = item['email'];
          var name = item['name']['first'] + " " + item['name']['last'];
          var id = item['login']['uuid'];
          var username = item['name']['first'];
          var image = item['picture']['large'];
          User user = User(
              id: id,
              username: username,
              name: name,
              email: email,
              image: image);
          users.add(user);
          log(users.toString());
        }
      } else {
        return Future.error('Something went wrong, ${response.statusCode}');
      }
    } catch (e) {
      return Future.error(e.toString());
    }
    return users;
  }
}
