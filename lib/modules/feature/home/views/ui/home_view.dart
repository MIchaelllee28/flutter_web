import 'package:flutter/material.dart';
import 'package:getx_template/config/theme/main_color.dart';
import 'package:getx_template/modules/feature/home/controllers/home_controller.dart';
import 'package:getx_template/modules/feature/home/views/component/contact/contact_dynamic.dart';
import 'package:getx_template/modules/feature/home/views/component/main/main_mobile.dart';
import 'package:getx_template/modules/feature/home/views/component/main/main_web.dart';
import 'package:getx_template/modules/feature/home/views/component/navbar_drawer.dart';
import 'package:getx_template/modules/feature/home/views/component/projects/projects_mobile.dart';
import 'package:getx_template/modules/feature/home/views/component/projects/projects_web.dart';
import 'package:getx_template/modules/feature/home/views/component/skills/skills_mobile.dart';
import 'package:getx_template/modules/feature/home/views/component/skills/skills_web.dart';
import 'package:getx_template/modules/feature/home/views/component/top_navbar.dart';
import 'package:getx_template/shared/styles/google_text_style.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TopNavbar(),
            LayoutBuilder(
              builder: (context, constraints) {
                if (screenWidth < 600) {
                  return MainMobile(
                    screenWidth: screenWidth,
                    key: HomeController.to.itemKeys[0],
                  );
                }
                return MainWeb(
                  screenWidth: screenWidth,
                  key: HomeController.to.itemKeys[0],
                );
              },
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                if (screenWidth < 600) {
                  return SkillsMobile(
                    key: HomeController.to.itemKeys[1],
                  );
                }
                return SkillsWeb(
                  screenWidth: screenWidth,
                  key: HomeController.to.itemKeys[1],
                );
              },
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                if (screenWidth < 1000) {
                  return ProjectsMobile(
                    screenWidth: screenWidth,
                    key: HomeController.to.itemKeys[2],
                  );
                }
                return ProjectsWeb(
                  screenWidth: screenWidth,
                  key: HomeController.to.itemKeys[2],
                );
              },
            ),
            ContactDynamic(
              key: HomeController.to.itemKeys[3],
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              decoration: BoxDecoration(
                color: MainColor.scaffoldBg,
              ),
              child: Text(
                "Made by Mike with flutter 3.9.18",
                style: GoogleTextStyle.fw200.copyWith(
                  color: MainColor.whiteSecondary,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
      endDrawer: NavbarDrawer(),
    );
  }
}
