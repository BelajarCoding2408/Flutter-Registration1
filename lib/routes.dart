import 'package:get/get.dart';
import 'package:project_flutter_loginpage/Pages/Confirmation_registration.dart';
import 'package:project_flutter_loginpage/Pages/registration_page.dart';

class Routes {
  static const String registration = '/registration';
  static const String confirmRegistration = '/confirm_registration';

  static final myPages = [
    GetPage(name: registration, page: () => RegistrationPage()),
    GetPage(name: confirmRegistration, page: () => ConfirmRegPage()),
  ];
}