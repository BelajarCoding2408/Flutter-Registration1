import 'package:flutter/material.dart';
import 'package:project_flutter_loginpage/routes.dart';
import 'package:project_flutter_loginpage/Pages/registration_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const RegistrationPage());
}

// ignore: camel_case_types
class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "My Learning App",
      initialRoute: Routes.registration,
      getPages: Routes.myPages,
    );
  }
}
