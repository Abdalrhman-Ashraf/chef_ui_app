// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors, unused_import

import 'package:chef_ui_app/core/function/navigator.dart';
import 'package:chef_ui_app/futuer/auth/widget/show_dialog.dart';
import 'package:chef_ui_app/futuer/home/widget/success_screen.dart';
import 'package:flutter/material.dart';
import '../widget/coustm_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController NewpasswordController = TextEditingController();
  final TextEditingController NewRpasswordControllerrr =
      TextEditingController();

  final TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() {
    setState(() {
      nameController.text = "";
      phoneController.text = "";
      emailController.text = "";
      passwordController.text = "";
      NewpasswordController.text = "";
      NewRpasswordControllerrr.text = "";
      locationController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
        ),
        title: const Text(
          "تعديل بيانات الحساب",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.03),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.15,
                    backgroundImage: AssetImage('asset/User.png'),
                  ),
                  CircleAvatar(
                    radius: screenWidth * 0.05,
                    backgroundColor: Colors.orange,
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              ProfileTextField(label: "الاسم", controller: nameController),
              ProfileTextField(
                label: "رقم الهاتف",
                controller: phoneController,
              ),
              ProfileTextField(
                label: "البريد الإلكتروني",
                controller: emailController,
              ),
              ProfileTextField(label: "الموقع", controller: locationController),
              ProfileTextField(
                label: "كلمة السر الحالية",
                controller: passwordController,
                obscureText: true,
              ),
              ProfileTextField(
                label: "كلمة السر الجديدة",
                controller: NewpasswordController,
                obscureText: true,
              ),
              ProfileTextField(
                label: "تأكيد كلمة السر",
                controller: NewRpasswordControllerrr,
                obscureText: true,
              ),
              SizedBox(height: screenHeight * 0.04),
              SizedBox(
                width: screenWidth * 0.7,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (context) => SuccessDialog(
                            title: "تهانياً",
                            message: "تم تعديل بيانات الحساب بنجاح",
                            onConfirm: () {
                              Navigator.pop(context);
                            },
                          ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.015,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      show_dialog(
                        context,
                        'تم تعديل بيانات الحساب',
                        pop(context, EditProfileScreen()),
                      );
                    },
                    child: const Text(
                      "حفظ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
