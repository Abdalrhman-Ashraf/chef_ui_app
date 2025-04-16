// ignore_for_file: avoid_print, unused_import, curly_braces_in_flow_control_structures

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/constant/images.dart';
import 'package:chef_ui_app/core/custom_widget/navbar.dart';
import 'package:chef_ui_app/core/function/navigator.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:chef_ui_app/futuer/auth/pages/register.dart';
import 'package:chef_ui_app/futuer/auth/widget/custom_text_field.dart';
import 'package:chef_ui_app/futuer/auth/widget/or_witget.dart';
import 'package:chef_ui_app/futuer/auth/widget/primary_button.dart';
import 'package:chef_ui_app/futuer/auth/widget/wiget_back.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool ispassword = true;
  bool ischeckbox = true;

  final formkey = GlobalKey<FormState>();
  late TextEditingController phonecontroller;
  late TextEditingController password;

  @override
  void initState() {
    super.initState();
    phonecontroller = TextEditingController();
    password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ======================= click back ===========================
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        actions: [
          WigetBack(
            onpress: () {
              //
            },
          ),
        ],
      ),
      backgroundColor: Appcolor.white,
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ==============Logo=======================================
                    SizedBox(
                      width: 186,
                      height: 186,
                      child: Image.asset(Appicons.Logo, fit: BoxFit.contain),
                    ),
                    //=================Text=====================================
                    Text(
                      "تسجيل الدخول",
                      style: getBodyTextStyle(context, fontSize: 32),
                    ),
                    SizedBox(height: 20),
                    //========================phone===============
                    CustomTextField(
                      //=============== controller =============
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Email";
                        }
                        return null;
                      },
                      controller: phonecontroller,
                      //==================================
                      hintText: "رقم الهاتف",
                      obscureText: false,
                      sufixicon: Icon(Icons.phone),
                      // controller: _phoneController,
                    ),
                    //========================Password===============
                    CustomTextField(
                      //==============controller=============
                      controller: password,
                      validator: (value) {
                        if (value!.isEmpty) return "Enter Your Password";

                        if (value.length < 8)
                          return "password must at lest 8 character";
                        return null;
                      },
                      //===========================
                      obscureText: ispassword,
                      sufixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            ispassword = !ispassword;
                          });
                        },
                        icon: Icon(
                          ispassword
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      hintText: "كلمة السر",
                    ),
                    //=====================forget password ==============
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                // GoRouter.of(
                                //   context,
                                // ).pushNamed(AppRoutes.forgetpassword);
                              },
                              child: Text(
                                "هل نسيت كلمة السر؟",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Appcolor.black,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            SizedBox(width: 90),
                            Text(
                              "تذكرني",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Appcolor.black,
                                  fontWeight: FontWeight.bold
                                ),
                            ),

                            Checkbox(
                              activeColor: Appcolor.primary,
                              value: ischeckbox,
                              onChanged: (value) {
                                setState(() {
                                  ischeckbox = value ?? false;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),

                    //======================== Login Button=================
                    Primarybutton(
                      onpress: () {
                        if (formkey.currentState!.validate()) {
                          print(phonecontroller.text);
                          print(password.text);
                        push(context, NavBar());
                        }
                      },

                      buttontext: "الدخول",
                      fontsize: 23,
                    ),
                    SizedBox(height: 20),
                    //=============  oR =========================
                    OrWitget(),
                    SizedBox(height: 20),
                    //================= text Don't have Account ===============
                    RichText(
                      text: TextSpan(
                        text: "ليس لديك حساب?",
                        style: getSmall17(context,color: Appcolor.black),
                        children: [
                          TextSpan(
                            text: "انشاء حساب",
                             style: getSmall17(context,color: Appcolor.primary,fontSize: 22),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    push(context, Register());
                                  },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
