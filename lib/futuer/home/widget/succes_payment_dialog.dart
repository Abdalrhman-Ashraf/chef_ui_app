// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/function/navigator.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:chef_ui_app/futuer/home/pages/payment/payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Future<dynamic> succes_payment_dialog(BuildContext context) {
  return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: Container(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                         onTap: (){
                            Navigator.pop(context);
                          },
                        child: SvgPicture.asset('asset/icons/XCircle.svg'))
                    ),
                    SizedBox(height: 10),
                   
                    SizedBox(height: 10),
                   Stack(
                    children: [
                      Center(child: Image.asset('asset/Confetti.png')),
                      Center(child: Image.asset('asset/Group.png'))
                    ],
                   ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Appcolor.primary, // Button color
                      ),
                      onPressed: () {
                        push(context, Payment()); // Action for button
                      },
                      child: Text('موافق',style: getBodyTextStyle(context,color:Appcolor.white),),
                    ),
                  ],
                ),
              ),
            );
          },
        );
}