import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_template/config/theme/main_color.dart';
import 'package:getx_template/constants/items/projects.dart';
import 'package:getx_template/modules/feature/home/controllers/home_controller.dart';
import 'package:getx_template/shared/styles/google_text_style.dart';

class ProjectsWeb extends StatelessWidget {
  final double screenWidth;
  const ProjectsWeb({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate relative sizes based on original dimensions
    final containerHeight = screenWidth * 0.445; // 855/1920 ≈ 0.445
    final horizontalPadding = screenWidth * 0.234; // 450/1920 ≈ 0.234
    final fontSize = screenWidth * 0.0156; // 30/1920 ≈ 0.0156

    return Container(
      color: MainColor.scaffoldBg,
      height: containerHeight,
      child: Column(
        children: [
          SizedBox(
            height: screenWidth * 0.0104, // 20/1920 ≈ 0.0104
          ),
          Text(
            "Projects",
            style: GoogleTextStyle.fw400.copyWith(
              color: MainColor.whitePrimary,
              fontSize: fontSize,
            ),
          ),
          SizedBox(
            height: screenWidth * 0.0104,
          ),
          SizedBox(
            height: containerHeight * 0.9, // 770/855 ≈ 0.9
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: screenWidth * 0.0104, // 20/1920
                  mainAxisSpacing: screenWidth * 0.0104,
                  mainAxisExtent: screenWidth * 0.182, // 350/1920 ≈ 0.182
                ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(screenWidth * 0.0026), // 5/1920
                    decoration: BoxDecoration(
                      color: MainColor.bgLight2,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                            child: Image.asset(
                              projectsItem[index]['image'],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsets.all(screenWidth * 0.0042), // 8/1920
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  projectsItem[index]['name'],
                                  style: GoogleTextStyle.fw500.copyWith(
                                    fontSize: screenWidth * 0.0083, // 16/1920
                                    color: MainColor.whitePrimary,
                                  ),
                                ),
                                Text(
                                  projectsItem[index]['description'],
                                  style: GoogleTextStyle.fw500.copyWith(
                                    fontSize: screenWidth * 0.00625, // 12/1920
                                    color: MainColor.whitePrimary,
                                  ),
                                ),
                                SizedBox(
                                    height: screenWidth * 0.0052), // 10/1920
                                Expanded(
                                  child: ClipRRect(
                                    child: GestureDetector(
                                      onTap: () {
                                        HomeController.to.urLlaunch(index);
                                      },
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        onEnter: (_) {
                                          HomeController.to
                                              .updateHoverState(index, true);
                                        },
                                        onExit: (_) {
                                          HomeController.to
                                              .updateHoverState(index, false);
                                        },
                                        child: Obx(
                                          () => Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: screenWidth * 0.0042,
                                              vertical: screenWidth * 0.0021,
                                            ),
                                            decoration: BoxDecoration(
                                              color: HomeController.to
                                                      .isHovered(index)
                                                  ? MainColor.yellowSecondary
                                                  : MainColor.hintDark,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Available in: ',
                                                  style: GoogleTextStyle.fw500
                                                      .copyWith(
                                                    fontSize: screenWidth *
                                                        0.0068, // 13/1920
                                                    color: HomeController.to
                                                                .isHovered(
                                                                    index) ==
                                                            true
                                                        ? MainColor.whitePrimary
                                                        : MainColor
                                                            .yellowPrimary,
                                                  ),
                                                ),
                                                Image.asset(
                                                  "lib/assets/images/icons/gitlab.png",
                                                  width: screenWidth *
                                                      0.0156, // 30/1920
                                                  height: screenWidth * 0.0156,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
