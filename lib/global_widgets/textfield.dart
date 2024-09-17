import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypeField extends StatelessWidget {
  final String? labeltext;
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefixIcon;

  const TypeField({super.key, this.labeltext, this.controller, this.prefixIcon,  this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(hintText ?? ""),
          prefixIcon: prefixIcon,
      ),
    );
  }
}