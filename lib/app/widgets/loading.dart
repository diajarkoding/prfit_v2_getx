import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text(
            'Please wait ...',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
