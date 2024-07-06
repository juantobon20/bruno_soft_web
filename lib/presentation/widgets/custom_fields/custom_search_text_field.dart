import 'package:flutter/material.dart';

import '../widgets.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: _buildBoxDecoration(),
      child: TextField(
        decoration: _inputDecoration(
          hint: 'Buscar', 
          icon: Icons.search_outlined
        )
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.grey.withOpacity(0.1)
  );

  InputDecoration _inputDecoration({
    required String hint,
    required IconData icon
  }) => InputDecoration(
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    hintText: hint,
    prefixIcon: Icon(icon, color: Colors.grey),
    labelStyle: CustomTextFont.textFieldStyle.copyWith(
      color: Colors.grey
    ),
    hintStyle: CustomTextFont.textFieldStyle.copyWith(
      color: Colors.grey
    )
  );
}