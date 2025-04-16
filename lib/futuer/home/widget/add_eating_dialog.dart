// ignore_for_file: sort_child_properties_last, non_constant_identifier_names, unused_local_variable, unused_label, avoid_print

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
//    String Starttime=DateFormat('hh:mma').format(DateTime.now());

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
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: SvgPicture.asset('asset/icons/XCircle.svg'),
//                     ),
//                   ),
//                   // Upload Image Section
//                   InkWell(
//                     onTap: (){
//                       showModalBottomSheet(
//                               context: context, builder:(context){
//                                backgroundColor:
//                                       Theme.of(context).scaffoldBackgroundColor;
//                               return Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   Container(
//                                     padding: EdgeInsets.all(10),
//                                     margin: EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(12),
//                                       color:Theme.of(context).scaffoldBackgroundColor,                                    ),
//                                     width: double.infinity,
//                                     child: TextButton(onPressed: (){
                                    
//                                       pickImage(true);
//                                       Navigator.pop(context);
//                                     }, child: Text('Camera',style: gettitlestyle(context,fontSize: 33,color:Appcolor.primary),)),
//                                   ),
//                                    Container(
//                                     padding: EdgeInsets.all(10),
//                                     margin: EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       color:Theme.of(context).scaffoldBackgroundColor,
//                                       borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     width: double.infinity,
//                                     child: TextButton(onPressed: (){
                                    
//                                       pickImage(false);
//                                       Navigator.pop(context);
//                                     }, child: Text('Gallary',style: gettitlestyle(context,fontSize: 33,color:Appcolor.primary),)),
//                                   ),
//                                 ],
//                               );
//                             });
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
//                           SizedBox(height: 8),
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
//                             padding: EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: Appcolor.primary,
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
                  

//                   // Select
//                   SizedBox(height: 12),

//                   // Add Title
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: "اسم الاكله",
//  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 22),
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

//                   // Description
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: "الوصف (المكونات/طريقة التحضير)",
//                        enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                         borderSide: BorderSide(
//                           color: Appcolor.primary,
//                           width: 3,
//                         ),
//                       ),
//                     ),
//                     maxLines: 3,
//                   ),
//                   SizedBox(height: 5),

//                   // Price and Discount
//                   Row(
//                     children: [
//                       Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: "السعر",
//                              contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
//                              enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                         borderSide: BorderSide(
//                           color: Appcolor.primary,
//                           width: 3,
//                         ),
//                       ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 8),
//                       Expanded(
//                         child: TextField(
//                           decoration: InputDecoration(
//                             hintText: "الخصم",
//                             contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
//                              enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                         borderSide: BorderSide(
//                           color: Appcolor.primary,
//                           width: 3,
//                         ),
//                       ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5),

//                   // Checkboxes
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: isFullComplete,
//                         onChanged: (value) {
//                           setState(() => isFullComplete = value!);
//                         },
//                       ),
//                       Expanded(child: Text("تسوية كاملة",style: getBodyTextStyle(context,color: Appcolor.primary,fontWeight: FontWeight.bold),)),
//                       Checkbox(
//                         value: isHalfComplete,
//                         onChanged: (value) {
//                           setState(() => isHalfComplete = value!);
//                         },
//                       ),
//                       Expanded(child: Text("نصف تسوي",style: getBodyTextStyle(context,color: Appcolor.primary,fontWeight: FontWeight.bold),)),
//                     ],
//                   ),
//                   SizedBox(height: 5),

//                   // Department Dropdown
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
//                         (val) => setState(() {
//                           selectedDepartment = val!;
//                         }),
//                     decoration: InputDecoration(
//                       contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 12),
//                         enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(25.0),
                        
//                         borderSide: BorderSide(
//                           color: Appcolor.primary,
//                           width: 3,
//                         ),
//                       ),),
//                   ),
//                   SizedBox(height: 6),

//                   // Button with Icon
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       // Pick time or date
//                     },
//                      style: ElevatedButton.styleFrom(
//                       backgroundColor: Appcolor.primary,
//                       fixedSize:Size (220,10),
//                     ),
//                     icon: Icon(Icons.access_time,color: Appcolor.black,),
//                     label: InkWell(
//                        onTap: () {
//                   showTimePicker(context: context, initialTime:TimeOfDay.now()).then((value){
//                     if(value !=null){
//                            setState(() {
//                              Starttime=value.format(context);
//                            });
//                         }
//                   });
//                 },
//                       child: Text("اضف وقت التحضير",style: getBodyTextStyle(context,color: Appcolor.white,fontSize: 17),)),
//                   ),
                  

//                   // Submit Button
//                   ElevatedButton(
//                     onPressed: () {
//                       // Add entry logic here
//                       Navigator.pop(context);
//                     },
                    
//                     child: Text("اضافة",style: getBodyTextStyle(context,color: Appcolor.white,fontSize: 17),),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Appcolor.primary,
//                       fixedSize:Size (100,10),
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



import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

void showAddDialog(BuildContext context) {
  bool isFullComplete = false;
  bool isHalfComplete = false;
  String selectedDepartment = 'حدد القسم';
  String startTime = DateFormat('hh:mma').format(DateTime.now());

  void pickImage(bool fromCamera) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: fromCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
    
      print("Picked file: ${pickedFile.path}");
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

                  // Upload Image Section
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
                                  pickImage(true);
                                  Navigator.pop(context);
                                },
                              ),
                              _buildImagePickerOption(
                                context,
                                label: 'Gallery',
                                onTap: () {
                                  pickImage(false);
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(Icons.upload_file, size: 60, color: Appcolor.primary),
                          Text(
                            "اضافة صورة",
                            style: getBodyTextStyle(context,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Appcolor.black),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: Appcolor.primary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'اختيار',
                              style: getBodyTextStyle(
                                context,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Appcolor.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  // Title
                  _buildTextField(context, hint: "اسم الاكله", padding: 22),

                  SizedBox(height: 12),

                  // Description
                  _buildTextField(
                    context,
                    hint: "الوصف (المكونات/طريقة التحضير)",
                    maxLines: 3,
                    padding: 12,
                  ),

                  SizedBox(height: 8),

                  // Price and Discount
                  Row(
                    children: [
                      Expanded(child: _buildTextField(context, hint: "السعر", padding: 12)),
                      SizedBox(width: 8),
                      Expanded(child: _buildTextField(context, hint: "الخصم", padding: 12)),
                    ],
                  ),

                  SizedBox(height: 8),

                  // Checkboxes
                  Row(
                    children: [
                      Checkbox(
                        value: isFullComplete,
                        onChanged: (value) => setState(() => isFullComplete = value!),
                      ),
                      Expanded(
                        child: Text("تسوية كاملة",
                            style: getBodyTextStyle(context,
                                color: Appcolor.primary, fontWeight: FontWeight.bold)),
                      ),
                      Checkbox(
                        value: isHalfComplete,
                        onChanged: (value) => setState(() => isHalfComplete = value!),
                      ),
                      Expanded(
                        child: Text("نصف تسوي",
                            style: getBodyTextStyle(context,
                                color: Appcolor.primary, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),

                  // Dropdown
                  DropdownButtonFormField<String>(
                    value: selectedDepartment,
                    items: ['حدد القسم', 'البيتزا', 'الحلويات', 'السندويتشات', 'اللحوم']
                        .map((dep) => DropdownMenuItem(value: dep, child: Text(dep)))
                        .toList(),
                    onChanged: (val) => setState(() => selectedDepartment = val!),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Appcolor.primary, width: 3),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  // Time Picker Button
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
                      style: getBodyTextStyle(context, color: Appcolor.white, fontSize: 17),
                    ),
                  ),

                  SizedBox(height: 12),

                  // Submit Button
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Appcolor.primary,
                      fixedSize: Size(140, 50),
                    ),
                    child: Text(
                      "اضافة",
                      style: getBodyTextStyle(context, color: Appcolor.white, fontSize: 17),
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

Widget _buildTextField(BuildContext context,
    {required String hint, int maxLines = 1, double padding = 12}) {
  return TextField(
    maxLines: maxLines,
    decoration: InputDecoration(
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: padding),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: BorderSide(color: Appcolor.primary, width: 3),
      ),
    ),
  );
}

Widget _buildImagePickerOption(BuildContext context,
    {required String label, required VoidCallback onTap}) {
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Theme.of(context).scaffoldBackgroundColor,
    ),
    width: double.infinity,
    child: TextButton(
      onPressed: onTap,
      child: Text(label, style: gettitlestyle(context, fontSize: 33, color: Appcolor.primary)),
    ),
  );
}
