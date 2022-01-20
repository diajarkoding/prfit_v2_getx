import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prfit_v2_getx/app/services/auth_service.dart';
import 'package:prfit_v2_getx/app/widgets/loading.dart';
import 'app/routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService().streamAuthStatus,
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.connectionState == ConnectionState.active) {
          return GetMaterialApp(
            title: "Application",
            initialRoute: snapshot.data != null && snapshot.data!.emailVerified
                ? Routes.MAIN
                : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        } else {
          return Loading();
        }
      },
    );
  }
}
