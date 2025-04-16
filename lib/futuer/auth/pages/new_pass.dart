// ignore_for_file: camel_case_types, must_be_immutable, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, sort_child_properties_last

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/custom_widget/navbar.dart';
import 'package:chef_ui_app/core/function/navigator.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:chef_ui_app/futuer/auth/widget/custom_text_field.dart';
import 'package:chef_ui_app/futuer/auth/widget/primary_button.dart';
import 'package:chef_ui_app/futuer/auth/widget/show_dialog.dart';
import 'package:chef_ui_app/futuer/auth/widget/wiget_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class New_password extends StatefulWidget {
  bool ispassword = true;
  bool iscpassword = true;
  New_password({super.key});

  @override
  State<New_password> createState() => _New_passwordState();
}

class _New_passwordState extends State<New_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [WigetBack()]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'إنشاء كلمة سر جديدة',
              style: getBodyTextStyle(context, fontSize: 37),
            ),
            SizedBox(height: 30),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    CustomTextField(
                      prefixicon: Icon(Icons.password_outlined),
                      sufixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.ispassword = !widget.ispassword;
                          });
                        },
                        icon: Icon(
                          widget.ispassword
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                        ),
                      ),
                      hintText: "ادخل كلمة السر",
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      prefixicon: Icon(Icons.password_outlined),
                      sufixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.iscpassword = !widget.iscpassword;
                          });
                        },
                        icon: Icon(
                          widget.iscpassword
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined,
                        ),
                      ),
                      hintText: "تأكيد كلمة السر ",
                    ),
                    SizedBox(height: 30),
                    Primarybutton(
                      buttontext: "اعادة تعيين كلمة السر",
                      fontsize: 23,
                      fontWeight: FontWeight.bold,
                      width: 320,
                      onpress: () {
                       // show_dialog(context,'تم تعديل كلمة السر بنجاح',);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
