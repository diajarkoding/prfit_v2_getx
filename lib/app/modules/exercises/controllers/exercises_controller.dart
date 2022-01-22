import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:prfit_v2_getx/app/data/models/exercises_model.dart';

class ExercisesController extends GetxController {
  final CollectionReference _exercisesRef =
      FirebaseFirestore.instance.collection('exercises');

  Future<QuerySnapshot<Object?>> getData() async {
    return _exercisesRef.get();
  }

  Future<List<Exercises>> fetchExercises() async {
    try {
      QuerySnapshot result = await _exercisesRef.get();
      List<Exercises> exercises = result.docs.map((e) {
        return Exercises.fromJson(e.data() as Map<dynamic, dynamic>);
      }).toList();
      return exercises;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
