// ignore_for_file: override_on_non_overriding_member, must_be_immutable, annotate_overrides, unused_import, avoid_print

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/constant/images.dart';
import 'package:chef_ui_app/core/function/navigator.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:chef_ui_app/futuer/auth/pages/description.dart';
import 'package:chef_ui_app/futuer/auth/widget/custom_text_field.dart';
import 'package:chef_ui_app/futuer/auth/widget/primary_button.dart';
import 'package:chef_ui_app/futuer/auth/widget/wiget_back.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  bool ispassword = true;
  bool iscpassword = true;

  Register({super.key});

  final formky = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();
  final TextEditingController confirmpasscontroller = TextEditingController();

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
       
        actions: [
          WigetBack(
            onpress: () {
              //
            },
          ),
        ],
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Form(
                key: widget.formky, // Correctly referencing the form key
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ==============Logo===============
                    SizedBox(
                      width: 186,
                      height: 150,
                      child: Image.asset(
                        Appicons.Logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                    //=================Text=======================
                    Text("انشاءحساب", style: getBodyTextStyle(context,fontSize: 33)),

                    //========================username===============
                    CustomTextField(
                      controller: widget.namecontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your username";
                        }
                        return null;
                      },
                      hintText: "الاسم",
                      sufixicon: Icon(Icons.person),
                    ),
                    //======================== phone ===================
                    CustomTextField(
                      controller: widget.phonecontroller,
                      validator: (value) {
                        if (value!.isEmpty) return "Enter Your Phone";

                        if (value.length != 11) {
                          return "Please Enter Correct phone";
                        }
                        return null;
                      },
                      hintText: "رقم الهاتف",
                      obscureText: false,
                      sufixicon: Icon(Icons.phone),
                    ),
                    //========================Email====================
                    CustomTextField(
                      controller: widget.emailcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your email";
                        }
                        return null;
                      },
                      hintText: "البريد الالكتروني",
                      iconfeild: Icons.email,
                      sufixicon: Icon(Icons.email),
                    ),
                    //========================Password===============
                    CustomTextField(
                      controller: widget.passcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your password";
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }
                        return null;
                      },
                      obscureText: widget.ispassword,
                      sufixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.ispassword = !widget.ispassword;
                          });
                        },
                        icon: Icon(
                          widget.ispassword
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      hintText: "كلمة السر",
                    ),
                    //========================Confirm Password===============
                    CustomTextField(
                      controller: widget.confirmpasscontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your confirm password";
                        }
                        if (value.length < 8) {
                          return "Password must be at least 8 characters";
                        }
                        if (value != widget.passcontroller.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      obscureText: widget.iscpassword,
                      sufixicon: IconButton(
                        onPressed: () {
                          setState(() {
                            widget.iscpassword = !widget.iscpassword;
                          });
                        },
                        icon: Icon(
                          widget.iscpassword
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                      hintText: "تاكيد كلمة السر",
                    ),
                    //========================Sign UP Button=================
                    Primarybutton(
                      onpress: () {
                        push(context, Description());
                      },
                      buttontext: "التالي",
                      fontsize: 30,
                      fontWeight: FontWeight.bold,
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
