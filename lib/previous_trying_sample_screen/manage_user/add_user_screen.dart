import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:quickgrocer_application/src/constants/sizes.dart';
import 'package:quickgrocer_application/src/constants/text_strings.dart';
import 'package:quickgrocer_application/src/features/authentication/models/user_model.dart';
import 'package:quickgrocer_application/previous_trying_sample_screen/manage_user_controller.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var iconColorWithoutBackground =
        Get.isDarkMode ? Colors.white : Colors.black;
    final controller = Get.put(ManageUserController());
    final _formKey = GlobalKey<FormState>();

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(LineAwesomeIcons.angle_left,
                color: iconColorWithoutBackground)),
        title: Text(
          addUser,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(defaultSize),
          child: Column(children: [
            Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //fullname
                    TextFormField(
                      controller: controller.fullName,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the user full name";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text(fullName),
                        prefixIcon: Icon(Icons.person_outline_rounded),
                      ),
                    ),
                    //email
                    const SizedBox(height: formHeight - 20.0),
                    TextFormField(
                      controller: controller.email,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9a-zA-Z@.]')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the user email";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text(email),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    //phone number
                    const SizedBox(height: formHeight - 20.0),
                    TextFormField(
                      controller: controller.phoneNumber,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9+]')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter the user phone number";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        label: Text(phoneNum),
                        prefixIcon: Icon(Icons.numbers),
                      ),
                    ),
                    const SizedBox(height: formHeight - 20.0),
                    //password
                    TextFormField(
                      controller: controller.password,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp('[ ]')),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password should be longer than 6 characters';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          label: Text(password),
                          prefixIcon: Icon(
                            Icons.fingerprint,
                          ),
                      ),
                    ),
                    const SizedBox(height: formHeight - 20.0),
                    Row(
                      children: [
                        Expanded(child: ElevatedButton(onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final newUser = UserModel(
                              fullName: controller.fullName.text.trim(),
                              email: controller.email.text.trim(),
                              phoneNo: controller.phoneNumber.text.trim(),
                              password: controller.password.text.trim(),
                            );
                            controller.createNewUser(newUser);

                            Navigator.pop(context);
                          }
                        },
                        child: const Text(addNewUser),
                        ))
                      ],
                    )
                  ]),
            )
          ]),
        ),
      ),
    ));
  }
}