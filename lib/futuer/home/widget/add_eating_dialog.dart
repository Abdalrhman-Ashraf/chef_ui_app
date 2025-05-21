// // ignore_for_file: unused_local_variable, avoid_print

// import 'package:chef_ui_app/core/constant/colors.dart';
// import 'package:chef_ui_app/core/utils/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';

// void showAddDialog(BuildContext context) {
//   bool isFullComplete = false;
//   bool isHalfComplete = false;
//   String selectedDepartment = 'حدد القسم';
//   String startTime = DateFormat('hh:mma').format(DateTime.now());

//   void pickImage(bool fromCamera) async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(
//       source: fromCamera ? ImageSource.camera : ImageSource.gallery,
//     );

//     if (pickedFile != null) {
//       print("Picked file: ${pickedFile.path}");
//     }
//   }

//   showDialog(
//     context: context,
//     builder: (context) {
//       return StatefulBuilder(
//         builder: (context, setState) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             content: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: InkWell(
//                       onTap: () => Navigator.pop(context),
//                       child: SvgPicture.asset('asset/icons/XCircle.svg'),
//                     ),
//                   ),

//                   // Upload Image Section
//                   InkWell(
//                     onTap: () {
//                       showModalBottomSheet(
//                         context: context,
//                         builder: (context) {
//                           return Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               _buildImagePickerOption(
//                                 context,
//                                 label: 'Camera',
//                                 onTap: () {
//                                   pickImage(true);
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                               _buildImagePickerOption(
//                                 context,
//                                 label: 'Gallery',
//                                 onTap: () {
//                                   pickImage(false);
//                                   Navigator.pop(context);
//                                 },
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                     child: Container(
//                       width: 220,
//                       height: 180,
//                       padding: EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Appcolor.primary, width: 3),
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Icon(
//                             Icons.upload_file,
//                             size: 60,
//                             color: Appcolor.primary,
//                           ),
//                           Text(
//                             "اضافة صورة",
//                             style: getBodyTextStyle(
//                               context,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold,
//                               color: Appcolor.black,
//                             ),
//                           ),
//                           Container(
//                             padding: EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 6,
//                             ),
//                             decoration: BoxDecoration(
//                               color: Appcolor.primary,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             child: Text(
//                               'اختيار',
//                               style: getBodyTextStyle(
//                                 context,
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                                 color: Appcolor.white,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 12),

//                   // Title
//                   _buildTextField(context, hint: "اسم الاكله", padding: 22),

//                   SizedBox(height: 12),

//                   // Description
//                   _buildTextField(
//                     context,
//                     hint: "الوصف (المكونات/طريقة التحضير)",
//                     maxLines: 3,
//                     padding: 12,
//                   ),

//                   SizedBox(height: 8),

//                   // Price and Discount
//                   Row(
//                     children: [
//                       Expanded(
//                         child: _buildTextField(
//                           context,
//                           hint: "السعر",
//                           padding: 12,
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: _buildTextField(
//                           context,
//                           hint: "الخصم",
//                           padding: 12,
//                         ),
//                       ),
//                     ],
//                   ),

//                   SizedBox(height: 8),

//                   // Checkboxes
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: isFullComplete,
//                         onChanged:
//                             (value) => setState(() => isFullComplete = value!),
//                       ),
//                       Expanded(
//                         child: Text(
//                           "تسوية كاملة",
//                           style: getBodyTextStyle(
//                             context,
//                             color: Appcolor.primary,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Checkbox(
//                         value: isHalfComplete,
//                         onChanged:
//                             (value) => setState(() => isHalfComplete = value!),
//                       ),
//                       Expanded(
//                         child: Text(
//                           "نصف تسوي",
//                           style: getBodyTextStyle(
//                             context,
//                             color: Appcolor.primary,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),

//                   SizedBox(height: 8),

//                   // Dropdown
//                   DropdownButtonFormField<String>(
//                     value: selectedDepartment,
//                     items:
//                         [
//                               'حدد القسم',
//                               'البيتزا',
//                               'الحلويات',
//                               'السندويتشات',
//                               'اللحوم',
//                             ]
//                             .map(
//                               (dep) => DropdownMenuItem(
//                                 value: dep,
//                                 child: Text(dep),
//                               ),
//                             )
//                             .toList(),
//                     onChanged:
//                         (val) => setState(() => selectedDepartment = val!),
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(
//                         vertical: 0,
//                         horizontal: 12,
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                         borderSide: BorderSide(
//                           color: Appcolor.primary,
//                           width: 3,
//                         ),
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 12),

//                   // Time Picker Button
//                   ElevatedButton.icon(
//                     onPressed: () async {
//                       TimeOfDay? pickedTime = await showTimePicker(
//                         context: context,
//                         initialTime: TimeOfDay.now(),
//                       );
//                       if (pickedTime != null) {
//                         setState(() => startTime = pickedTime.format(context));
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Appcolor.primary,
//                       fixedSize: Size(220, 50),
//                     ),
//                     icon: Icon(Icons.access_time, color: Appcolor.black),
//                     label: Text(
//                       "اضف وقت التحضير",
//                       style: getBodyTextStyle(
//                         context,
//                         color: Appcolor.white,
//                         fontSize: 17,
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 12),

//                   // Submit Button
//                   ElevatedButton(
//                     onPressed: () => Navigator.pop(context),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Appcolor.primary,
//                       fixedSize: Size(140, 50),
//                     ),
//                     child: Text(
//                       "اضافة",
//                       style: getBodyTextStyle(
//                         context,
//                         color: Appcolor.white,
//                         fontSize: 17,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       );
//     },
//   );
// }

// Widget _buildTextField(
//   BuildContext context, {
//   required String hint,
//   int maxLines = 1,
//   double padding = 12,
// }) {
//   return TextField(
//     maxLines: maxLines,
//     decoration: InputDecoration(
//       hintText: hint,
//       contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: padding),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25.0),
//         borderSide: BorderSide(color: Appcolor.primary, width: 3),
//       ),
//     ),
//   );
// }

// Widget _buildImagePickerOption(
//   BuildContext context, {
//   required String label,
//   required VoidCallback onTap,
// }) {
//   return Container(
//     padding: EdgeInsets.all(10),
//     margin: EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(12),
//       color: Theme.of(context).scaffoldBackgroundColor,
//     ),
//     width: double.infinity,
//     child: TextButton(
//       onPressed: onTap,
//       child: Text(
//         label,
//         style: gettitlestyle(context, fontSize: 33, color: Appcolor.primary),
//       ),
//     ),
//   );
// }

// ignore_for_file: unused_local_variable, avoid_print

import 'dart:io';

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:chef_ui_app/futuer/home/pages/eating/data/block/add_block.dart';
import 'package:chef_ui_app/futuer/home/pages/eating/data/block/add_event.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

void showAddDialog(BuildContext context) {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final offerPriceController = TextEditingController();

  File? pickedImage;
  String selectedDepartment = 'حدد القسم';
  String startTime = DateFormat('hh:mma').format(DateTime.now());

  final Map<String, String> departmentToId = {
    'البيتزا': '1',
    'الحلويات': '2',
    'السندويتشات': '3',
    'اللحوم': '4',
  };

  void pickImage(
    bool fromCamera,
    void Function(void Function()) setState,
  ) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() => pickedImage = File(pickedFile.path));
    }
  }

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset('asset/icons/XCircle.svg'),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              _buildImagePickerOption(
                                context,
                                label: 'Camera',
                                onTap: () {
                                  pickImage(true, setState);
                                  Navigator.pop(context);
                                },
                              ),
                              _buildImagePickerOption(
                                context,
                                label: 'Gallery',
                                onTap: () {
                                  pickImage(false, setState);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      width: 220,
                      height: 180,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Appcolor.primary, width: 3),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:
                          pickedImage == null
                              ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.upload_file,
                                    size: 60,
                                    color: Appcolor.primary,
                                  ),
                                  Text(
                                    "اضافة صورة",
                                    style: getBodyTextStyle(
                                      context,
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )
                              : Image.file(pickedImage!, fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 12),
                  _buildTextField(
                    context,
                    controller: nameController,
                    hint: "اسم الاكله",
                  ),
                  SizedBox(height: 12),
                  _buildTextField(
                    context,
                    controller: descriptionController,
                    hint: "الوصف",
                    maxLines: 3,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTextField(
                          context,
                          controller: priceController,
                          hint: "السعر",
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _buildTextField(
                          context,
                          controller: offerPriceController,
                          hint: "الخصم",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    value: selectedDepartment,
                    items:
                        [
                              'حدد القسم',
                              'البيتزا',
                              'الحلويات',
                              'السندويتشات',
                              'اللحوم',
                            ]
                            .map(
                              (dep) => DropdownMenuItem(
                                value: dep,
                                child: Text(dep),
                              ),
                            )
                            .toList(),
                    onChanged:
                        (val) => setState(() => selectedDepartment = val!),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Appcolor.primary,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton.icon(
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        setState(() => startTime = pickedTime.format(context));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolor.primary,
                      fixedSize: Size(220, 50),
                    ),
                    icon: Icon(Icons.access_time, color: Appcolor.black),
                    label: Text(
                      "اضف وقت التحضير",
                      style: getBodyTextStyle(
                        context,
                        color: Appcolor.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      final catId = departmentToId[selectedDepartment] ?? '1';

                      final data = {
                        'name': nameController.text,
                        'description': descriptionController.text,
                        'price': priceController.text,
                        'offer_price': offerPriceController.text,
                        'preparation_time': startTime,
                        'category_id': catId,
                        'status': 'active',
                        'image': pickedImage,
                      };

                      context.read<FoodBloc>().add(AddFoodEvent(data));
                      Navigator.pop(context);
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolor.primary,
                      fixedSize: Size(140, 50),
                    ),
                    child: Text(
                      "اضافة",
                      style: getBodyTextStyle(
                        context,
                        color: Appcolor.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

Widget _buildTextField(
  BuildContext context, {
  required TextEditingController controller,
  required String hint,
  int maxLines = 1,
}) {
  return TextField(
    controller: controller,
    maxLines: maxLines,
    decoration: InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Appcolor.primary, width: 3),
      ),
    ),
  );
}

Widget _buildImagePickerOption(
  BuildContext context, {
  required String label,
  required VoidCallback onTap,
}) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    child: TextButton(
      onPressed: onTap,
      child: Text(
        label,
        style: gettitlestyle(context, fontSize: 20, color: Appcolor.primary),
      ),
    ),
  );
}
