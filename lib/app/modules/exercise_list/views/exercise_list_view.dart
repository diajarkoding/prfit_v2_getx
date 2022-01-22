import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prfit_v2_getx/app/data/models/exercises_model.dart';
import 'package:prfit_v2_getx/app/modules/exercise_detail/views/exercise_detail_view.dart';
import '../controllers/exercise_list_controller.dart';

class ExerciseListView extends GetView<ExerciseListController> {
  final Exercises exercises;

  ExerciseListView(this.exercises);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            exercises.name,
          ),
        ),
        body: ListView.builder(
            itemCount: exercises.tutorialList.length,
            itemBuilder: (snapshot, index) {
              return Card(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(exercises.tutorialList[index]['name'],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400)),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: const Color(0xffFFFFFF),
                      child: Image.network(
                        exercises.tutorialList[index]['image'],
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    onTap: () {
                      Get.to(() => ExerciseDetailView(exercises),
                          arguments: index);
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     // builder: (context) => const AbsDetail(),
                      //   ),
                      // );
                    },
                  ),
                ),
              );
            }));
  }
}
