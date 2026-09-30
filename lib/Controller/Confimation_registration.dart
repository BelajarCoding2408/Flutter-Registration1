import 'package:get/get.dart';

class ConfirmRegController extends GetxController {
  final List<String> nama = [];
  final List<String> alamat = [];
  final List<String> email = [];
  final List<String> noWhatsapp = [];
  final List<String> jenisKelamin = [];

  @override
  void onInit() {
    super.onInit();
    final arguments = Get.arguments as Map<String, dynamic>? ?? {};

    nama.add(arguments['nama']?.toString() ?? '');
    alamat.add(arguments['alamat']?.toString() ?? '');
    email.add(arguments['email']?.toString() ?? '');
    noWhatsapp.add(arguments['no_whatsapp']?.toString() ?? '');
    jenisKelamin.add(arguments['jenis_kelamin']?.toString() ?? '');
  }
}
