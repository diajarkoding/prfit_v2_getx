import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/abs_list_controller.dart';

class AbsListView extends GetView<AbsListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Latihan Otot Perut',
          ),
        ),
        body: ListView(
          children: [
            Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  title: const Text('Air Bike',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xffFFFFFF),
                    child: Image.asset(
                      'assets/abs/air_bike.gif',
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     // builder: (context) => const AbsDetail(),
                    //   ),
                    // );
                  },
                ),
              ),
            )
          ],
        ));
  }
}
