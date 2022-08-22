import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = new TextEditingController();
  final String url = 'https://jsonplaceholder.typicode.com/users';
  // Get json result and convert it to model. Then add

  Future<void> getUserDetails() async {
    try {
      final response = await http.get(Uri.parse(url));

      List data = jsonDecode(response.body);
      // final responseJson = json.decode(response.body);
      // log(data.toString());
      setState(() {
        for (Map user in data) {
          _userDetails.add(UserDetails.fromJson(user));
        }
      });
      log(_userDetails.toString());
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();

    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 10.0,
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        hintText: 'Search', border: InputBorder.none),
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.cancel),
                    onPressed: () {
                      controller.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: _searchResult.isNotEmpty || controller.text.isNotEmpty
                ? ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, i) {
                      return Card(
                        margin: const EdgeInsets.all(0.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              _searchResult[i].profileUrl,
                            ),
                          ),
                          title: Text(
                              '${_searchResult[i].firstName} ${_searchResult[i].lastName}'),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: _userDetails.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(0.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                              _userDetails[index].profileUrl,
                            ),
                          ),
                          title: Text(
                              '${_userDetails[index].firstName} ${_userDetails[index].lastName}'),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  onSearchTextChanged(String text) async {
    log(text);
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _userDetails.forEach((userDetail) {
      log('call function');
      log(userDetail.toString());
      if (userDetail.firstName.contains(text) ||
          userDetail.lastName.contains(text)) _searchResult.add(userDetail);
    });

    setState(() {});
    log(_searchResult[0].firstName.toString());
  }
}

List<UserDetails> _searchResult = [];

List<UserDetails> _userDetails = [];

class UserDetails {
  final int id;
  final String firstName, lastName, profileUrl;

  UserDetails(
      {required this.id,
      required this.firstName,
      required this.lastName,
      this.profileUrl =
          'https://cdn.pixabay.com/photo/2015/06/22/08/38/siblings-817369_960_720.jpg'});
  factory UserDetails.fromJson(Map<dynamic, dynamic> json) {
    return UserDetails(
      id: json['id'],
      firstName: json['name'],
      lastName: json['username'],
    );
  }
}
