import 'package:flutter/material.dart';

class LoadingButtonLogin extends StatelessWidget {
  const LoadingButtonLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(right: 4),
              child: const CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
            Text(
              'Loading',
            ),
          ],
        ),
      ),
    );
  }
}
