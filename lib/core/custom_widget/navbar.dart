// ignore_for_file: deprecated_member_use

import 'package:chef_ui_app/core/constant/colors.dart';
import 'package:chef_ui_app/core/constant/images.dart';
import 'package:chef_ui_app/futuer/home/pages/eating/screen/eating.dart';
import 'package:chef_ui_app/futuer/home/pages/home/Home.dart';
import 'package:chef_ui_app/futuer/home/pages/payment/payment.dart';
import 'package:chef_ui_app/futuer/home/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectindex = 0;
  List<Widget> pages = [
    Profilw_view(),
    Payment(),
    Eating_view(),
    HomePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[selectindex],
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Appcolor.primary,
            unselectedItemColor: Appcolor.text_color,
            currentIndex: selectindex,
            onTap: (value) {
              setState(() {
                selectindex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Appicons.profileSvg),
                  activeIcon: SvgPicture.asset(
                    Appicons.profileSvg,
                    color: Appcolor.primary,
                  ),
                  label: 'الملف الشخصي'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Appicons.paymentSvg),
                  activeIcon: SvgPicture.asset(
                    Appicons.paymentSvg,
                    color: Appcolor.primary,
                  ),
                  label: 'المحفظه'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Appicons.EatingSvg),
                  activeIcon: SvgPicture.asset(
                    Appicons.EatingSvg,
                    color: Appcolor.primary,
                  ),
                  label: 'اكلاتي'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(Appicons.HomeSvg),
                  activeIcon: SvgPicture.asset(
                    Appicons.HomeSvg,
                    color: Appcolor.primary,
                  ),
                  label: 'الرئسيه'),
            ]),
      ),
    );
  }
}