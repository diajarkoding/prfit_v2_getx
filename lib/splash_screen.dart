import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Image.asset(
            'assets/logo/logo_fix.png',
            width: 200,
            height: 200,
          ),
          // child: Container(
          //   margin: const EdgeInsets.only(bottom: 20),
          //   width: MediaQuery.of(context).size.width * 0.5,
          //   height: MediaQuery.of(context).size.height * 0.4,
          //   decoration: const BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/logo/logo_fix.png'),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
