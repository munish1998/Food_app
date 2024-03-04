import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:foods_app/Home_Screen.dart';
import 'package:foods_app/Login_page.dart';
import 'package:foods_app/Screens/Create_Account.dart';
import 'package:foods_app/Screens/Create_Screen.dart';
import 'package:foods_app/Screens/Dress_Screen.dart';
import 'package:foods_app/Screens/Main_Screen.dart';
import 'package:foods_app/Screens/Onboarding_Screen/Onboarding_Screen.dart';
import 'package:foods_app/Screens/Onboarding_Screen/Tutorial_Screen1.dart';
import 'package:foods_app/Screens/Sig_Up_Screen.dart';
import 'package:foods_app/Screens/Splash_Screen.dart';
import 'package:foods_app/Screens/Welcome_Screen.dart';
import 'package:foods_app/Sign_In_page.dart';
import 'package:foods_app/Sign_Up_Page.dart';

import 'package:foods_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
      // builder: EasyLoading.init(),
    );
  }
}
