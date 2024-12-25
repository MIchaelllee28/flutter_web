import 'package:flutter/material.dart';
import 'package:getx_template/config/theme/main_color.dart';
import 'package:getx_template/modules/feature/home/controllers/home_controller.dart';
import 'package:getx_template/shared/styles/google_text_style.dart';

class ContactDynamic extends StatelessWidget {
  const ContactDynamic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    // Calculate dynamic values based on screen width
    final double horizontalPadding =
        screenWidth * 0.2; // 300 is roughly 20% of 1500

    // 50% of screen width for larger screens
    final double iconSize = screenWidth * 0.016; // 24 is roughly 1.6% of 1500
    final double fontSize = screenWidth * 0.016; // 24 is roughly 1.6% of 1500
    final double gridPadding = screenWidth * 0.1; // 150 is 10% of 1500

    return Container(
      color: MainColor.bgLight1,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Contact Me',
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: MainColor.whitePrimary,
              ),
            ),
            SizedBox(height: 20), // 20 is roughly 1.3% of 1500
            Container(
              color: MainColor.bgLight1,
              padding:
                  EdgeInsets.symmetric(horizontal: 20), // 20 is 1.3% of 1500
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: HomeController.to.name,
                    decoration: InputDecoration(
                      hintText: 'Your Name',
                      hintStyle: GoogleTextStyle.fw200
                          .copyWith(color: MainColor.hintDark),
                      fillColor: MainColor.whitePrimary,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10), // 10 is roughly 0.7% of 1500
                  TextField(
                    controller: HomeController.to.email,
                    decoration: InputDecoration(
                      hintText: 'Your Email',
                      hintStyle: GoogleTextStyle.fw200
                          .copyWith(color: MainColor.hintDark),
                      fillColor: MainColor.whitePrimary,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 9),
                  TextField(
                    controller: HomeController.to.message,
                    maxLines: 15,
                    decoration: InputDecoration(
                      hintText: 'Your Message',
                      hintStyle: GoogleTextStyle.fw200
                          .copyWith(color: MainColor.hintDark),
                      fillColor: MainColor.whitePrimary,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 9),
                  MouseRegion(
                    child: ElevatedButton(
                      onPressed: () {
                        HomeController.to.submitForm();
                      },
                      child: Text(
                        "Get in touch",
                        style: GoogleTextStyle.fw500.copyWith(
                          color: MainColor.whitePrimary,
                          fontSize: screenWidth * 0.01, // 15 is 1% of 1500
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: MainColor.yellowPrimary,
                        padding:
                            EdgeInsets.symmetric(vertical: screenWidth * 0.013),
                        fixedSize: Size.fromWidth(screenWidth),
                      ),
                    ),
                  ),
                  SizedBox(height: 40), // 40 is roughly 2.7% of 1500
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: gridPadding),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 5,
                        mainAxisExtent:
                            screenWidth * 0.027, // 40 is 2.7% of 1500
                        crossAxisSpacing:
                            screenWidth * 0.007, // 10 is 0.7% of 1500
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        List<IconData> icons = [
                          Icons.facebook,
                          Icons.phone_android,
                          Icons.link,
                          Icons.mail,
                          Icons.phone,
                        ];
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            icons[index],
                            color: MainColor.bgLight1,
                            size: iconSize,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
