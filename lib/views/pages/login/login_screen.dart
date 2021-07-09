import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/constants/app_images.dart';
import 'package:getx_template/constants/app_sizes.dart';
import 'package:getx_template/views/pages/home_screen.dart';
import 'package:getx_template/views/pages/signup/signup_screen.dart';
import 'package:getx_template/views/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "logo",
              child: Image.asset(
                AppImages.LOGO,
                // fit: BoxFit.fitWidth,
                height: AppSizes.height / 8,
                alignment: Alignment.center,
              ),
            ),
            SizedBox(
              height: AppSizes.GAP_MD,
            ),
            CustomTextField(
              icon: Icons.phone,
              hintText: "Phone",
              isNumberInputOnly: true,
            ),
            CustomTextFieldPassword(
              icon: Icons.vpn_key_rounded,
              hintText: "Password",
            ),
            SizedBox(
              height: AppSizes.GAP_MD,
            ),
            CustomButton(
              isExpand: true,
              text: "Login",
              onPressed: () {
                Get.to(HomeScreen());
              },
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Forgot password?",
                    style:
                        TextStyle(color: Get.theme.textTheme.headline6?.color),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // Single tapped.
                      },
                  ),
                  TextSpan(
                      text: ' Click here',
                      style: TextStyle(
                        color: Get.theme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Double tapped.
                        }),
                ],
              ),
            ),
            SizedBox(
              height: AppSizes.GAP_SM,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSocialMediaButton(
                imageIcon: AppImages.FACEBOOK,
                onPressed: () {},
              ),
              CustomSocialMediaButton(
                imageIcon: AppImages.GOOGLE,
                onPressed: () {},
              ),
              CustomSocialMediaButton(
                imageIcon: AppImages.TWITTER,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: AppSizes.GAP_EX_SM,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Don't have an account?",
                  style:
                  TextStyle(color: Get.theme.textTheme.headline6?.color),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      // Single tapped.
                    },
                ),
                TextSpan(
                    text: " Signup",
                    style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(SignUpScreen());
                      }),
              ],
            ),
          ),
          SizedBox(
            height: AppSizes.GAP_EX_SM,
          ),
        ],
      )
    );
  }
}
