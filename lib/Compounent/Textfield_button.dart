import 'colomn_button.dart';
import 'custom_button.dart';
import 'package:flutter/material.dart';

class AngkaTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const AngkaTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType:
            const TextInputType.numberWithOptions(decimal: true, signed: true),
        style: const TextStyle(fontSize: 16),
        // KeyboardType memunculkan angka dengan koma serta tanda negatif
        // TextField controller menghubungkan input ke controller dari user otomatis tersimpan

        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}