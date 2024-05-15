import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key, required this.hintText,this.onchange,  this.inputType});
  final String hintText;
  Function(String)? onchange;
  TextInputType? inputType;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText:hintText ,

        border: OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder:  OutlineInputBorder(
          borderSide: BorderSide(),
          borderRadius: BorderRadius.circular(8),
        ),
      ),);
  }
}
