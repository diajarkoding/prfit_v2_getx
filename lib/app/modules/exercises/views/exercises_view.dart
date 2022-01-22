import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prfit_v2_getx/app/data/models/exercises_model.dart';
import 'package:prfit_v2_getx/app/widgets/tutorial_card.dart';
import '../controllers/exercises_controller.dart';

class ExercisesView extends GetView<ExercisesController> {
  @override
  Widget build(BuildContext context) {
    final exerciseController = Get.put(ExercisesController());
    Widget tutorial() {
      return FutureBuilder<List<Exercises>>(
        future: exerciseController.fetchExercises(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Exercises> exercises = snapshot.data!;
            return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: exercises.map((e) => TutorialCard(e)).toList());
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
    }
    //   return Wrap(
    //     spacing: 10,
    //     runSpacing: 10,
    //     children: const [
    //       TutorialCard(imageUrl: 'assets/exercises/abs.png', title: 'abs'),
    //       TutorialCard(imageUrl: 'assets/exercises/back.png', title: 'back'),
    //       TutorialCard(
    //           imageUrl: 'assets/exercises/biceps.png', title: 'biceps'),
    //       TutorialCard(
    //           imageUrl: 'assets/exercises/calves.png', title: 'calves'),
    //       TutorialCard(imageUrl: 'assets/exercises/chest.png', title: 'chest'),
    //       TutorialCard(
    //           imageUrl: 'assets/exercises/forearms.png', title: 'forearms'),
    //       TutorialCard(
    //           imageUrl: 'assets/exercises/upperlegs.png', title: 'legs'),
    //       TutorialCard(
    //           imageUrl: 'assets/exercises/shoulders.png', title: 'shoulders'),
    //       TutorialCard(
    //           imageUrl: 'assets/exercises/triceps.png', title: 'triceps'),
    //     ],
    //   );
    // }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [Text("Tutorial"), Icon(Icons.more_vert)],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: tutorial(),
        ));
  }
}
