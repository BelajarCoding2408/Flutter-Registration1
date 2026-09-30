import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_flutter_loginpage/Controller/Confimation_registration.dart';

class ConfirmRegPage extends StatelessWidget {
  ConfirmRegPage({super.key});

  final ConfirmRegController controller = Get.put(ConfirmRegController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Confirm Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _DataList(title: 'Nama', values: controller.nama),
            _DataList(title: 'Alamat', values: controller.alamat),
            _DataList(title: 'E-mail', values: controller.email),
            _DataList(title: 'No WhatsApp', values: controller.noWhatsapp),
            _DataList(title: 'Jenis Kelamin', values: controller.jenisKelamin),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Oke'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DataList extends StatelessWidget {
  const _DataList({required this.title, required this.values});

  final String title;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: values.map((value) => Text(value)).toList(),
        ),
      ),
    );
  }
}
