import 'dart:async';

import 'package:flutter/material.dart';

class StreamDataExampleTwo extends StatefulWidget {
  const StreamDataExampleTwo({Key? key}) : super(key: key);

  @override
  State<StreamDataExampleTwo> createState() => _StreamDataExampleTwoState();
}

class _StreamDataExampleTwoState extends State<StreamDataExampleTwo> {
  Stream<int> addStreamData() async* {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 2));
      yield i;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addStreamData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100.0,
            ),
            StreamBuilder(
                stream: addStreamData().where((event) => event.isEven),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    } else {
                      return Text(snapshot.data.toString());
                    }
                  }
                }),
          ],
        ),
      ),
    );
  }
}
