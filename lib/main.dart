import 'package:flutter/material.dart';
import 'package:prfit_v2_getx/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:prfit_v2_getx/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(
        Duration(seconds: 2),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MediaQuery(data: MediaQueryData(), child: SplashScreen());
        } else {
          return MyApp();
        }
      },
    );
  }
}
