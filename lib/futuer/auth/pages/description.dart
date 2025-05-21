// ignore_for_file: unused_label

import 'dart:io';

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/constant/images.dart';
import 'package:chef_ui_app/core/function/navigator.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:chef_ui_app/futuer/auth/pages/verify_otp_page.dart';
import 'package:chef_ui_app/futuer/auth/widget/primary_button.dart';
import 'package:chef_ui_app/futuer/auth/widget/wiget_back.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  String? path;
  String? name;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(Appicons.Logo, fit: BoxFit.contain),
                Text(
                  'انشاء حساب',
                  style: getBodyTextStyle(
                    context,
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Appcolor.primary,
                      radius: 70,
                      backgroundImage:
                          (path != null)
                              ? FileImage(File(path ?? ' '))
                              : AssetImage('asset/User.png'),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 8,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor;
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color:
                                          Theme.of(
                                            context,
                                          ).scaffoldBackgroundColor,
                                    ),
                                    width: double.infinity,
                                    child: TextButton(
                                      onPressed: () {
                                        pickImage(true);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Camera',
                                        style: gettitlestyle(
                                          context,
                                          fontSize: 33,
                                          color: Appcolor.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(
                                            context,
                                          ).scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    width: double.infinity,
                                    child: TextButton(
                                      onPressed: () {
                                        pickImage(false);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Gallary',
                                        style: gettitlestyle(
                                          context,
                                          fontSize: 33,
                                          color: Appcolor.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.camera_alt_rounded,
                            color: Appcolor.primary,
                            size: 33,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'الشيف محمد',
                  style: getBodyTextStyle(
                    context,
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: TextFormField(
                    maxLines: 3, // Ensures the TextFormField has 6 lines
                    decoration: InputDecoration(
                      hintText: "الوصف..........",
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 3,
                        ), // Orange border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 3,
                        ), // Border when enabled
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.orange,
                          width: 2,
                        ), // Border when focused
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 22),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Appcolor.primary,
                  ),

                  child: Primarybutton(
                    onpress: () {
                      push(context, Verifyotp());
                    },
                    buttontext: "تسجيل",
                    fontsize: 23,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  pickImage(bool isCamera) {
    ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
          if (value != null) {
            setState(() {
              path = value.path;
            });
            // App_local_storage.cashdata(App_local_storage.Kimage, path);
          }
        });
  }
}
