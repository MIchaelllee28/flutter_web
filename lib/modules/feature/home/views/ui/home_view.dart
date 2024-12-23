import 'package:flutter/material.dart';
import 'package:getx_template/config/theme/main_color.dart';
import 'package:getx_template/modules/feature/home/views/component/main_mobile.dart';
import 'package:getx_template/modules/feature/home/views/component/main_web.dart';
import 'package:getx_template/modules/feature/home/views/component/navbar_drawer.dart';
import 'package:getx_template/modules/feature/home/views/component/skills_mobile.dart';
import 'package:getx_template/modules/feature/home/views/component/skills_web.dart';
import 'package:getx_template/modules/feature/home/views/component/top_navbar.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          TopNavbar(),
          LayoutBuilder(
            builder: (context, constraints) {
              if (screenWidth < 600) {
                return MainMobile(screenWidth: screenWidth);
              }
              return MainWeb(screenWidth: screenWidth);
            },
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              if (screenWidth < 600) {
                return SkillsMobile();
              }
              return SkillsWeb(screenWidth: screenWidth);
            },
          ),
          Container(
            color: MainColor.scaffoldBg,
            height: 200,
          ),
        ],
      ),
      endDrawer: NavbarDrawer(),
    );
  }
}
