import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prfit_v2_getx/app/data/models/exercises_model.dart';
import 'package:prfit_v2_getx/app/modules/exercise_list/views/exercise_list_view.dart';

class TutorialCard extends StatelessWidget {
  final Exercises exercises;

  const TutorialCard(
    this.exercises, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => ExerciseListView(exercises)),
      // onTap: () => Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => ExerciseListView(exercises))),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.296,
        height: MediaQuery.of(context).size.height * 0.24,
        child: Column(
          children: [
            Image.network(
              exercises.image,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Text(exercises.name)
          ],
        ),
      ),
    );
  }
}
