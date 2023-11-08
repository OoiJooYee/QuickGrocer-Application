import 'package:flutter/material.dart';
import 'package:quickgrocer_application/src/common_widgets/form/form_header_widget.dart';
import 'package:quickgrocer_application/src/constants/sizes.dart';
import 'package:quickgrocer_application/src/constants/image_strings.dart';
import 'package:quickgrocer_application/src/constants/text_strings.dart';
import 'package:quickgrocer_application/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(defaultSize),
            child: Column(
              children: [
                SizedBox(height: defaultSize * 4),
                FormHeaderWidget(
                  image: resetPasswordImage,
                  title: forgetPasswordTitle,
                  subTitle: emailVerification,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: formHeight),
                Form(
                  child: Column(
                    children:[
                      TextFormField(
                        decoration: InputDecoration(
                          label: Text(email),
                          hintText: email,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const OTPScreen()),
                            );
                          },
                          child: const Text(next),
                        ),
                      ),
                    ]
                  ),
                ),
              ],
            )
          ),
        )
      ),
    );
  }
}