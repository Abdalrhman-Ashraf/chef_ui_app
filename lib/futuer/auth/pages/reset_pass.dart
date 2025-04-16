// ignore_for_file: unused_import

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/constant/images.dart';
import 'package:chef_ui_app/core/function/navigator.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:chef_ui_app/futuer/auth/pages/verify_otp_page.dart';
import 'package:chef_ui_app/futuer/auth/widget/custom_text_field.dart';
import 'package:chef_ui_app/futuer/auth/widget/primary_button.dart';
import 'package:chef_ui_app/futuer/auth/widget/wiget_back.dart';
import 'package:flutter/material.dart';

class ReseetPass extends StatefulWidget {
  const ReseetPass({super.key});

  @override
  State<ReseetPass> createState() => _ReseetPassState();
}

class _ReseetPassState extends State<ReseetPass> {
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
        child: Column(
          
          children: [
            
            Text('اعادة تعين كلمة السر',style: getBodyTextStyle(context,fontSize: 28),),
            Spacer(),
            Image.asset(Appicons.resetPass,fit: BoxFit.cover,),
            Spacer(),
           Text('ادخل رقم الهاتف المرتبط بحسابك وسنرسل اليك رمز',style: getBodyTextStyle(context,fontSize: 15,)),
           Text('لإعادة تعيين كلمة المرور الخاصة بك',style: getBodyTextStyle(context,fontSize: 15),),
           Spacer(),
           CustomTextField(
                      
                      
                      
                      hintText: "رقم الهاتف",
                      
                      obscureText: false,
                      sufixicon: Icon(Icons.phone),
                     
                    ),
                    Spacer(flex: 1,),
                    Primarybutton(
                      buttontext: 'ارسال الرمز',
                      fontsize: 23,
                      fontWeight: FontWeight.bold,
                      onpress: (){
                        push(context, Verifyotp());
                      },
                    ),
                    Spacer(flex: 2,),
           ],
        ),
      ),
    );
  }
}