import 'package:flutter/widgets.dart';
import 'package:getx_template/config/theme/main_color.dart';
import 'package:getx_template/constants/items/skill_items.dart';
import 'package:getx_template/shared/styles/google_text_style.dart';

class SkillsWeb extends StatelessWidget {
  final double screenWidth;
  const SkillsWeb({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust values based on screen width
        final containerHeight = screenWidth > 1200 ? 260.0 : 210.0;
        final fontSize = screenWidth * 0.017; // Dynamic font size
        final leftPadding = screenWidth * 0.08; // 8% of screen width
        final rightPadding = screenWidth * 0.04; // 4% of screen width
        final rightPaddingSecond = screenWidth * 0.15; // 20% of screen width
        final iconSize = screenWidth * 0.012; // Dynamic icon size
        final gridSpacing = screenWidth * 0.004; // Dynamic grid spacing

        return Container(
          color: MainColor.bgLight1,
          height: containerHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenWidth * 0.015),
              Expanded(
                child: Text(
                  "What I can do",
                  style: GoogleTextStyle.fw500.copyWith(
                    color: MainColor.whitePrimary,
                    fontSize: fontSize,
                  ),
                ),
              ),
              SizedBox(height: screenWidth * 0.03),
              Expanded(
                flex: 4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: leftPadding, right: rightPadding),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: screenWidth > 800 ? 2 : 2,
                            mainAxisSpacing: gridSpacing,
                            crossAxisSpacing: gridSpacing,
                            childAspectRatio: screenWidth > 1200 ? 5 : 4,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: MainColor.bgLight2,
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: iconSize,
                                    height: iconSize,
                                    decoration: BoxDecoration(
                                      color: MainColor.bgLight1,
                                      borderRadius:
                                          BorderRadius.circular(iconSize / 2),
                                    ),
                                    child: Icon(deviceItems[index]['icon'],
                                        size: iconSize,
                                        color: MainColor.whitePrimary),
                                  ),
                                  SizedBox(width: screenWidth * 0.01),
                                  Text(
                                    deviceItems[index]['skill'],
                                    style: GoogleTextStyle.fw500.copyWith(
                                      fontSize: fontSize * 0.75,
                                      color: MainColor.whitePrimary,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: rightPaddingSecond),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: screenWidth > 1200
                                ? 4
                                : (screenWidth > 800 ? 3 : 2),
                            mainAxisSpacing: gridSpacing,
                            crossAxisSpacing: gridSpacing,
                            mainAxisExtent: screenWidth * 0.030,
                          ),
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(gridSpacing / 2),
                              decoration: BoxDecoration(
                                color: MainColor.scaffoldBg,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    skillItems[index]['image'],
                                    width: iconSize,
                                  ),
                                  SizedBox(width: screenWidth * 0.008),
                                  Text(
                                    skillItems[index]['skill'],
                                    style: GoogleTextStyle.fw500.copyWith(
                                      fontSize: fontSize * 0.5,
                                      color: MainColor.whitePrimary,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
