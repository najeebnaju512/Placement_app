import 'package:flutter/material.dart';

class TextFieldScreen extends StatelessWidget {
  final Color? textColour;
  final Icon? suffixIcon;
  final Color? iconColour;
  final FontWeight? fontModal;
  final String? hintText;
  final TextInputType? keyBoardType;
  final Icon? prefixIcon;
  final int? maxLines;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final Key? formKey;
  final String? labelText;

  TextFieldScreen(
      {this.prefixIcon,
        this.textColour,
        this.suffixIcon,
        this.iconColour,
        this.fontModal,
        this.keyBoardType,
        this.hintText,
        this.maxLines,
        this.validator,
        this.controller,
        this.formKey,
        this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: formKey,
        child: TextFormField(
            validator: validator,
            controller: controller,
            keyboardType: keyBoardType,
            maxLines: maxLines,
            decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: hintText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                iconColor: iconColour)),
      ),
    );
  }
}