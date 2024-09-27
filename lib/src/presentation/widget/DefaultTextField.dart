// lib/src/presentation/widget/DefaultTextField.dart
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool obscureText;
  final Function(String text) onChange;
  final String? errorText;
  final TextInputType type; // Se inicializa con un valor por defecto
  final Color? color;
  final String? Function(String?)? validator;

  DefaultTextField({
    Key? key,
    required this.label,
    this.errorText,
    this.validator,
    this.color = Colors.white,
    required this.icon,
    required this.onChange,
    this.obscureText = false,
    this.type = TextInputType.text, // Inicialización en el constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obscureText,
        onChanged: (text) {
          onChange(text);
        },
        keyboardType: type,
        validator: validator,
        decoration: InputDecoration(
          label: Text(label, style: TextStyle(color: color)),
          errorText: errorText,
          prefixIcon: Icon(icon, color: color),
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color!)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color!)),
        ),
        style: TextStyle(color: color));
  }
}
