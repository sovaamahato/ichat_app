import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ichat_app/Authentication/authentication_controller.dart';
import 'package:ichat_app/Authentication/sign_up_page.dart';

import 'Authentication/login_page.dart';
import 'pages/home_page.dart';

void main() async {

  await WidgetsFlutterBinding.ensureInitialized();
  
   Firebase.initializeApp().then(
    (value) {
      Get.put(AuthenticationController());
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:const HomePage(),

      initialBinding: BindingsBuilder(() {
        Get.put(AuthenticationController());
      }),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/SignUpPage', page: () => SignUpPage()),
      ],
    );
  }
}
