// mobile_main.dart
import 'package:flutter/material.dart';
import 'package:getx_template/config/theme/main_color.dart';
import 'package:getx_template/shared/styles/google_text_style.dart';

class MainMobile extends StatelessWidget {
  final double screenWidth;

  const MainMobile({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MainColor.scaffoldBg,
      height: 515,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image at the top
          Image.asset(
            'lib/assets/images/cats_2.png',
            width: screenWidth * 0.6, // 80% of screen width
          ),
          const SizedBox(height: 5),
          // Text and button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi! \nI'm Mike \nJunior Flutter Developer",
                  style: GoogleTextStyle.fw500.copyWith(
                    fontSize: 20, // Smaller font size for mobile
                    color: MainColor.whitePrimary,
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: screenWidth * 0.4,
                  height: 35,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColor.yellowPrimary,
                        foregroundColor: MainColor.yellowSecondary,
                      ),
                      child: Text(
                        "Get in touch",
                        style: GoogleTextStyle.fw500.copyWith(
                          color: MainColor.whitePrimary,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
