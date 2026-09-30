import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  final namaController = TextEditingController();
  final alamatController = TextEditingController();
  final emailController = TextEditingController();
  final whatsappController = TextEditingController();
  final jenisKelamin = 'Laki-laki'.obs;

  final List<String> pilihanJenisKelamin = ['Laki-laki', 'Perempuan'];

  Map<String, dynamic> get registrationData => {
        'nama': namaController.text,
        'alamat': alamatController.text,
        'email': emailController.text,
        'no_whatsapp': whatsappController.text,
        'jenis_kelamin': jenisKelamin.value,
      };

  @override
  void onClose() {
    namaController.dispose();
    alamatController.dispose();
    emailController.dispose();
    whatsappController.dispose();
    super.onClose();
  }
}