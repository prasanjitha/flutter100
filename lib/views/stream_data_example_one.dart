import 'dart:async';

import 'package:flutter/material.dart';

class StreamDataExampleOne extends StatefulWidget {
  const StreamDataExampleOne({Key? key}) : super(key: key);

  @override
  State<StreamDataExampleOne> createState() => _StreamDataExampleOneState();
}

class _StreamDataExampleOneState extends State<StreamDataExampleOne> {
  final StreamController _controller = StreamController();
  addStreamData() async {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 2));
      _controller.sink.add(i);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addStreamData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.close();
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
                stream: _controller.stream,
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
