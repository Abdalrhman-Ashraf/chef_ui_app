// ignore_for_file: avoid_print, sized_box_for_whitespace, unused_import, sort_child_properties_last

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/constant/images.dart';
import 'package:chef_ui_app/core/custom_widget/navbar.dart';
import 'package:chef_ui_app/core/function/navigator.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:chef_ui_app/futuer/auth/pages/reset_pass.dart';
import 'package:chef_ui_app/futuer/auth/widget/primary_button.dart';
import 'package:chef_ui_app/futuer/auth/widget/show_dialog.dart';
import 'package:chef_ui_app/futuer/auth/widget/wiget_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verifyotp extends StatefulWidget {
  const Verifyotp({super.key});

  @override
  State<Verifyotp> createState() => _VerifyotpState();
}

class _VerifyotpState extends State<Verifyotp> {
  bool ispassword = true;

  final formkey = GlobalKey<FormState>();
  late TextEditingController pincodecontroller;

  @override
  void initState() {
    super.initState();
    pincodecontroller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ======================= click back =============
      appBar: AppBar(
        leading: WigetBack(
          onpress: () {
            //   GoRouter.of(context).pop();
          },
        ),
      ),
      backgroundColor: Appcolor.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // ==============Logo===============
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Image.asset(Appicons.Elipse1),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Image.asset(Appicons.Elipse2),
                        ),
                        Image.asset(Appicons.otp),
                      ],
                    ),
                  ),

                  //=================Text=======================
                  Text("OTP Verification", style: getBodyTextStyle(context)),
                  SizedBox(height: 25),
                  // ======================= pin code ===========
                  Padding(
                    padding: const EdgeInsets.only(right: 15, left: 15),
                    child: PinCodeTextField(
                      textStyle: TextStyle(color: Colors.amber),
                      appContext: context,
                      length: 4,
                      controller: pincodecontroller,
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        fieldWidth: 42,
                        fieldHeight: 42,
                        shape: PinCodeFieldShape.circle,
                        selectedColor: Appcolor.primary,
                        inactiveColor: Colors.grey,
                      ),
                      onChanged: (value) {
                        print("pin value : $value");
                      },
                      // onCompleted: (value) {
                      //   GoRouter.of(context).pushNamed(AppRoutes.newpassword);
                      // },
                    ),
                  ),
                  //========================Password===============
                  SizedBox(height: 20),
                  Text(
                    "لم يصلني كود تحقق؟ ارسل مره أخري",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(height: 100),
                  //======================== Verifyotp Button=================
                  Primarybutton(
                    onpress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Container(
                              height: 400,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Center(
                                        child: Image.asset(
                                          'asset/Bubbles.png',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Center(
                                        child: SvgPicture.asset(
                                          'asset/icons/Verified.svg',
                                        ),
                                      ),
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
                                    'تم تعديل بيانات الحساب', // ✅ Use passed message
                                    style: getBodyTextStyle(
                                      context,
                                      fontSize: 25,
                                      color: Appcolor.black,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      pushrelacement(context, NavBar());
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
                    },

                    buttontext: "تاكيد",
                    fontsize: 23,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
