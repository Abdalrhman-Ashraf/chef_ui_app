// ignore_for_file: camel_case_types, avoid_unnecessary_containers

import 'package:chef_ui_app/futuer/home/widget/empty_eating.dart';
import 'package:chef_ui_app/futuer/home/widget/list_eating.dart';
import 'package:chef_ui_app/futuer/home/widget/notfification.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Eating_view extends StatelessWidget {
   Eating_view({super.key});
  final List<Map<String, dynamic>> dinners = [
    {
      'name': 'سلطة الجمبري',
      'stars': 4,
      'price': '69ج.م',
      'image': 'asset/dinner.png',
    },
    {
      'name': 'فرخة باربيكيو',
      'stars': 5,
      'price': '69ج.م',
      'image': 'asset/dinner.png',
    },
    {
      'name': 'طبق ارز بالجمبري ',
      'stars': 3,
      'price': '69ج.م',
      'image': 'asset/dinner.png',
    },
  ];

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: notification(context),
      body: dinners.isEmpty? Center(
        child: empaty_eating(context),
      ):list_eating_item(context,dinners),
    );
  }











    pickImage(bool isCamera) {
    ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
    });
  }
}
