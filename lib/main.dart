import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ichat_app/Authentication/sign_up_page.dart';

import 'Authentication/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),

      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/SignUpPage', page: () => SignUpPage()),
      ],
    );
  }
}
