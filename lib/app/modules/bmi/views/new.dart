import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  _BmiCalculatorState createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentindex = 0;
  String result = "";
  double height = 0;
  double weight = 0;
  String status = "";

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: whiteColor,
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
              Row(
                children: [
                  radioButton("Laki - Laki", Colors.blue, 0),
                  radioButton("Perempuan", Colors.pink, 1),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Masukan tinggi badan :",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: heightController,
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
                height: 20.0,
              ),
              const Text(
                "Masukan berat badan :",
                style: TextStyle(fontSize: 18.0),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: weightController,
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
                    setState(() {
                      height = double.parse(heightController.value.text);
                      weight = double.parse(weightController.value.text);
                    });

                    calculateBmi(
                      height,
                      weight,
                    );
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
                  child: Text(
                    result,
                    style: const TextStyle(
                        fontSize: 40.0, fontWeight: FontWeight.bold),
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
                        "$status\n",
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
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        height: 80.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: currentindex == index ? color : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {
            changeIndex(index);
          },
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
