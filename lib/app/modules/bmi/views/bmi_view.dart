import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bmi_controller.dart';

class BmiView extends GetView<BmiController> {
  @override
  Widget build(BuildContext context) {
    BmiController bmiC = Get.put(BmiController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [Text("BMI Kalkulator"), Icon(Icons.more_vert)],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Masukan tinggi badan :",
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: bmiC.heightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Cm",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              const Text(
                "Masukan berat badan :",
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: bmiC.weightController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: "Kg",
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    bmiC.height =
                        double.parse(bmiC.heightController.value.text);
                    bmiC.weight =
                        double.parse(bmiC.weightController.value.text);
                    bmiC.calculateBmi(
                      bmiC.height,
                      bmiC.weight,
                    );

                    bmiC.heightController.clear();
                    bmiC.weightController.clear();
                  },
                  child: const Text(
                    "Hitung",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    "BMI kamu adalah :",
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Obx(
                    () => Text(
                      bmiC.result.toString(),
                      style: const TextStyle(
                          fontSize: 40.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "${bmiC.status}\n",
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "BMI < 18      = Berat Badan Kurang\nBMI 18 - 25 = Berat Badan Normal\nBMI > 25      = Berat Badan Berlebih",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
