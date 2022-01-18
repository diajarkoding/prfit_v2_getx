import 'package:flutter/material.dart';

class TutorialCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  const TutorialCard({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => const AbsList())),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.296,
        height: MediaQuery.of(context).size.height * 0.239,
        child: Column(
          children: [
            Image.asset(
              imageUrl,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}
