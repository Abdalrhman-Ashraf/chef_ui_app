// ignore_for_file: avoid_unnecessary_containers, avoid_print, deprecated_member_use, unused_import, sized_box_for_whitespace

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/function/navigator.dart';
import 'package:chef_ui_app/core/utils/text_style.dart';
import 'package:chef_ui_app/futuer/auth/widget/wiget_back.dart';
import 'package:chef_ui_app/futuer/home/pages/notificatio/notification.dart';
import 'package:chef_ui_app/futuer/home/widget/custom_listtile.dart';
import 'package:chef_ui_app/futuer/home/widget/payment_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [WigetBack()],
        leading: InkWell(
          onTap: (){
            push(context, NotificationPage());
          },
          child: Icon(Icons.notifications_active)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'المحفظة',
                style: getBodyTextStyle(
                  context,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.black,
                ),
              ),
            ),
            SizedBox(height: 10),
            Image.asset('asset/Banner.png', fit: BoxFit.cover),
            Gap(10),
            Center(
              child: InkWell(
                onTap: (){
                   Show_payment_dialog(context);
                },
                child: Container(
                  width: 250,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Appcolor.primary,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      Gap(7),
                      Text(
                        'طلب سحب من المحفظة',
                        style: getBodyTextStyle(
                          context,
                          fontSize: 17,
                          color: Appcolor.white,
                        ),
                      ),
                      Gap(5),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 201, 201, 201),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'asset/Vector.png',
                          fit: BoxFit.cover,
                          height: 22,
                          width: 22,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Gap(10),
            Text(
              'اخر معاملاتي النقدية',
              style: getBodyTextStyle(
                context,
                fontSize: 14,
                color: Appcolor.primary,
              ),
            ),

            Expanded(
            child: ListView(
  children: [
CustomListTile(
  leadingText1: 'سحب رصيد',
  leadingText2: 'المبلغ',
  trailingDate: '2-1-2025',
  trailingAmount: '150 جنية مصري',
  svgIconPath: 'asset/icons/Vector (2).svg',
  leadingText1Color: Appcolor.redcolor,
  leadingText2Color: Appcolor.primary,
),

CustomListTile(
  leadingText1: 'سحب رصيد',
  leadingText2: 'المبلغ',
  trailingDate: '2-1-2025',
  trailingAmount: '150 جنية مصري',
  svgIconPath: 'asset/icons/Vector (2).svg',
  leadingText1Color: Appcolor.redcolor,
  leadingText2Color: Appcolor.primary,
),

CustomListTile(
  leadingText1: 'سحب رصيد',
  leadingText2: 'المبلغ',
  trailingDate: '2-1-2025',
  trailingAmount: '150 جنية مصري',
  svgIconPath: 'asset/icons/Vector (2).svg',
  leadingText1Color: Appcolor.redcolor,
  leadingText2Color: Appcolor.primary,
),
  ],
),

            ),
          ],
        ),
      ),
    );
  }


}
