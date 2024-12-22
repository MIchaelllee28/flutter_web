import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_template/modules/feature/home/views/pages/authentication/login/login_screen.dart';
import 'package:getx_template/utils/widgets/custom_pin_input/mpin_page.dart';
import 'package:getx_template/utils/widgets/widgets.dart';

class OtpInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        transparentBg: true,
      ),
      body: Center(
          child: CustomPinInput(
        pinLength: 4,
        resendDuration: 10,
        matchingOtp: "1234",
        onMatched: (mPin) {
          print('You entered -> $mPin');
          Get.offAll(LoginScreen());
        },
        resendOnPress: () {},
      )),
    );
  }
}
