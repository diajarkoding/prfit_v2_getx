import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prfit_v2_getx/app/controllers/auth_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  Widget build(BuildContext context) {
    final authController = AuthController();

    Widget imageHome() {
      return Container(
        width: 350,
        height: 300,
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
        margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffFFFFFF),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 1)]),
        child: Image.asset(
          "assets/pinangria/0.jpg",
        ),
      );
    }

    Widget textHome() {
      return Container(
        width: 350,
        height: 465,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffFFFFFF),
            boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 1)]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 25),
              child: Text("PRFit v1.0",
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 25),
              child:
                  Text("Iskandar Muhaemin", style: TextStyle(fontSize: 15.0)),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Text("1803010081", style: TextStyle(fontSize: 15.0)),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text("UNIVERSITAS PERJUANGAN TASIKMALAYA",
                  style: TextStyle(fontSize: 15)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Image.asset(
                "assets/pinangria/unper.png",
                height: 70,
                width: 70,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Sumber : ", style: TextStyle(fontSize: 15.0)),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("www.gymexercisesapp.com",
                  style: TextStyle(fontSize: 15.0)),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Text("www.jefit.com", style: TextStyle(fontSize: 15.0)),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0),
              child: Text("Copyright 2021", style: TextStyle(fontSize: 12.0)),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("PRFit"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [imageHome(), textHome()],
        ),
      ),
    );
  }
}
