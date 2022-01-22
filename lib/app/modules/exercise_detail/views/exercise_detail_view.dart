import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:prfit_v2_getx/app/data/models/exercises_model.dart';

import '../controllers/exercise_detail_controller.dart';

class ExerciseDetailView extends GetView<ExerciseDetailController> {
  final Exercises exercises;
  ExerciseDetailView(this.exercises);

  @override
  Widget build(BuildContext context) {
    Widget imageTutorial() {
      return Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffFFFFFF),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 1)]),
        child: Image.network(
          exercises.tutorialList[Get.arguments]['image'],
          width: 350,
          height: 350,
        ),
      );
    }

    Widget textTutorial() {
      return Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffFFFFFF),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 1)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(exercises.tutorialList[Get.arguments]['name'],
                  style: TextStyle(fontSize: 21.0)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                children: [
                  Text(
                    "Bagian otot : ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Text(
                    exercises.tutorialList[Get.arguments]['muscle'],
                    style: TextStyle(fontSize: 15.0),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  "Alat : ",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                ),
                Text(
                  exercises.tutorialList[Get.arguments]['equipment'],
                  style: TextStyle(fontSize: 15.0),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
              child: Text(
                "Tutorial : ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Text(
              exercises.tutorialList[Get.arguments]['tutorial']
                  .replaceAll('\\n', '\n'),
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(exercises.tutorialList[Get.arguments]['name']),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [imageTutorial(), textTutorial()],
        ),
      ),
    );
  }
}
