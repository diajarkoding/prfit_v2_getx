import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BmiController extends GetxController {
  late TextEditingController heightController;
  late TextEditingController weightController;
  RxString result = ''.obs;
  String status = '';
  double height = 0;
  double weight = 0;

  void calculateBmi(double height, double weight) {
    double finalresult = weight / (height * height / 10000);
    if (finalresult < 18) {
      status = "Berat Badan Kurang";
    } else if (finalresult < 26) {
      status = "Berat Badan Normal";
    } else {
      status = "Berat Badan Berlebih";
    }
    String bmi = finalresult.toStringAsFixed(2);

    result.value = bmi;
  }

  @override
  void onInit() {
    heightController = TextEditingController();
    weightController = TextEditingController();

    super.onInit();
  }
}
