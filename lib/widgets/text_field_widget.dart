import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  const TextFieldWidget(
      {super.key, required this.controller, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: const BorderSide(),
                  borderRadius: BorderRadius.circular(20)),
              labelText: labelText),
        ),
      ),
    );
  }
}
