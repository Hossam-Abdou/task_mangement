import 'package:flutter/material.dart';

import '../colors/custom_colors.dart';

class CustomField extends StatelessWidget {
  String? label;
  int? maxLines;
  final TextEditingController controller;




  CustomField({required this.label,required this.controller,this.maxLines});

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      maxLines: maxLines,
      validator: (value) {
        if (value!.isEmpty) {
          return 'The Field Can\'t Be Empty';
        }
        return null;
      },
      cursorColor: CustomColors.darkBlue,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(color:CustomColors.darkBlue),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.darkBlue),

        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.darkBlue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CustomColors.darkBlue,),
          ),

      ),
    );
  }
}
