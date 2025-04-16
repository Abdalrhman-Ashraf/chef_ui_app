import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? sufixicon;
  final Icon?prefixicon;
  final double? width;
  final double? hight;
  final IconData? iconfeild;
  final Color? feildcolor;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    this.hintText,
    this.sufixicon,
    this.prefixicon,
    this.width,
    this.hight,
    this.iconfeild,
    this.feildcolor,
    this.controller,
    this.validator,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 358,
      height: hight ?? 90,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          
          //=======================
          controller: controller,
          validator: validator,
          //==========================
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: Appcolor.primary, width: 5.0),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Appcolor.primary),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Appcolor.primary, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Appcolor.primary, width: 5),
            ),

            fillColor: feildcolor ?? Appcolor.white,
            filled: true,
            suffixIcon: sufixicon,
            prefixIcon: prefixicon,
          ),
        ),
      ),
    );
  }
}
