import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class WigetBack extends StatelessWidget {
  final void Function()? onpress;
  const WigetBack({super.key, this.onpress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Appcolor.primary,
          border: Border.all(color: Appcolor.primary),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: IconButton(
            onPressed: onpress,
            icon: Icon(Icons.arrow_circle_left_sharp),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
