// ignore_for_file: camel_case_types, no_logic_in_create_state, unused_element, library_private_types_in_public_api

import 'package:chef_ui_app/core/function/navigator.dart';
import 'package:chef_ui_app/futuer/auth/pages/log_in.dart';
import 'package:chef_ui_app/futuer/home/pages/notificatio/notification.dart';
import 'package:chef_ui_app/futuer/home/widget/coustm_text_field.dart';
import 'package:chef_ui_app/futuer/home/widget/edit_profile_Screen.dart';
import 'package:flutter/material.dart';


class Profilw_view extends StatefulWidget {
  const Profilw_view({super.key});

  @override
  _Profilw_viewState createState() => _Profilw_viewState();
}

class _Profilw_viewState extends State<Profilw_view> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
      locationController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.orange),
        ),
        title: const Text(
          "الملف الشخصي",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {

          
            push(context, NotificationPage());
          
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.15,
                    backgroundImage: AssetImage('asset/logo.png'),
                  ),
                  CircleAvatar(
                    radius: screenWidth * 0.05,
                    backgroundColor: Colors.orange,
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt,
                          color: Colors.white, size: 18),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon:
                        const Icon(Icons.edit, color: Colors.orange, size: 20),
                    onPressed: () {
                      push(context, EditProfileScreen());
                    },
                  ),
                  //const SizedBox(width: 5),
                  const Text(
                    "وليد القدافي عبدالوهاب",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text("waleed_al qdafi22@gmail.com",
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              SizedBox(height: screenHeight * 0.03),
              ProfileTextField(label: "الاسم", controller: nameController),
              ProfileTextField(
                  label: "رقم الهاتف", controller: phoneController),
              ProfileTextField(
                  label: "البريد الإلكتروني", controller: emailController),
              ProfileTextField(
                  label: "كلمة المرور",
                  controller: passwordController,
                  obscureText: true),
              ProfileTextField(label: "الموقع", controller: locationController),
              SizedBox(height: screenHeight * 0.04),
              SizedBox(
                width: screenWidth * 0.6,
                child: OutlinedButton.icon(
                  onPressed: () {
                    pushrelacement(context,LogIn());
                  },
                  icon: const Icon(Icons.logout, color: Colors.red),
                  label: const Text('تسجيل الخروج',
                      style: TextStyle(color: Colors.red)),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
