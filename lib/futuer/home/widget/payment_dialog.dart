// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:chef_ui_app/futuer/home/widget/succes_payment_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<dynamic> Show_payment_dialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SvgPicture.asset('asset/icons/XCircle.svg'),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'حدد المبلغ المطلوب سحبه',
                style: getBodyTextStyle(
                  context,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.add),
                  prefixIcon: Icon(Icons.remove),
                  border: OutlineInputBorder(),
                  hintText: '00.00 جنية مصري',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolor.primary, // Button color
                ),
                onPressed: () {
                  succes_payment_dialog(context);
                },
                child: Text(
                  'موافق',
                  style: getBodyTextStyle(context, color: Appcolor.white),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
