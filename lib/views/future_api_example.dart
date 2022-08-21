import 'package:flutter/material.dart';

class FutureAPIExample extends StatefulWidget {
  FutureAPIExample({Key? key}) : super(key: key);

  @override
  State<FutureAPIExample> createState() => _FutureAPIExampleState();
}

class _FutureAPIExampleState extends State<FutureAPIExample> {
  Future<String> getEmail() async {
    String email = await Future.delayed(const Duration(seconds: 2), () {
      return 'nirmalPra12@gmail.com';
    });
    return email;
  }

  Future<void> getEmailData() async {
    print(await getEmail());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmailData();
  }

  String email = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100.0,
            ),
            Text(email.toString()),
            RaisedButton(
              onPressed: () async {
                String myEmail = await getEmail();
                setState(() {
                  email = myEmail;
                });
              },
              child: const Text('Get Email'),
            )
          ],
        ),
      ),
    );
  }
}
