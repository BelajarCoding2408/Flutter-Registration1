import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_flutter_loginpage/Controller/registration_controller.dart';
import 'package:project_flutter_loginpage/routes.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({super.key});

  final RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registration Page')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: controller.namaController,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: controller.alamatController,
              decoration: const InputDecoration(
                labelText: 'Alamat',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: controller.emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            TextField(
              controller: controller.whatsappController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: 'No WhatsApp',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),
            Obx(
              () => DropdownButtonFormField<String>(
                initialValue: controller.jenisKelamin.value,
                decoration: const InputDecoration(
                  labelText: 'Jenis Kelamin',
                  border: OutlineInputBorder(),
                ),
                items: controller.pilihanJenisKelamin
                    .map(
                      (jenisKelamin) => DropdownMenuItem(
                        value: jenisKelamin,
                        child: Text(jenisKelamin),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.jenisKelamin.value = value;
                  }
                },
              ),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(
                  Routes.confirmRegistration,
                  arguments: controller.registrationData,
                );
              },

              child: const Text('Send'),
            ),
          ],
          
        ),
      ),
    );
  }
}