import 'package:flutter/material.dart';
import 'package:getx_template/config/theme/main_color.dart';
import 'package:getx_template/shared/styles/google_text_style.dart';

class MainWeb extends StatelessWidget {
  final double screenWidth;

  const MainWeb({Key? key, required this.screenWidth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MainColor.scaffoldBg,
      height: 515,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi! \nI'm Mike \nJunior Flutter Developer",
                style: GoogleTextStyle.fw500.copyWith(
                  fontSize: 30,
                  color: MainColor.whitePrimary,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Get in touch",
                  style: GoogleTextStyle.fw500.copyWith(
                    color: MainColor.whitePrimary,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: MainColor.yellowPrimary,
                  overlayColor: MainColor.yellowSecondary,
                ),
              )
            ],
          ),
          Image.asset(
            'lib/assets/images/cats_2.png',
            width: screenWidth * 0.35,
          )
        ],
      ),
    );
  }
}
