// ignore_for_file: sort_child_properties_last, non_constant_identifier_names, sized_box_for_whitespace, unused_local_variable, unused_element

import 'package:chef_ui_app/core/constant/colors.dart' show Appcolor;
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void show_dialog(BuildContext context, String message, Function ontap) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Center(
                    child: Image.asset('asset/Bubbles.png', fit: BoxFit.cover),
                  ),
                  Center(child: SvgPicture.asset('asset/icons/Verified.svg')),
                ],
              ),
              Text(
                'تهانياً',
                style: getBodyTextStyle(
                  context,
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.primary,
                ),
              ),
              Text(
                message, // ✅ Use passed message
                style: getBodyTextStyle(
                  context,
                  fontSize: 25,
                  color: Appcolor.black,
                ),
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                onPressed: () {
                  ontap() {}
                },
                child: Text(
                  'موافق',
                  style: getBodyTextStyle(
                    context,
                    fontSize: 25,
                    color: Appcolor.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolor.primary,
                  fixedSize: const Size(180, 30),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
