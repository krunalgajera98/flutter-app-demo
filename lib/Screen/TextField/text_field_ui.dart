import 'package:demo_flutter/Screen/TextField/controller.dart';
import 'package:demo_flutter/Widgets/gradiant_text_field.dart';
import 'package:demo_flutter/Widgets/text_form_feild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldUI extends StatelessWidget {
  static const routeName = '/TextFieldUI';

  TextFieldUI({Key? key}) : super(key: key);
  final TextFieldController _fieldController = Get.put(TextFieldController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              controller: _fieldController.userNameController,
              focusNode: FocusNode(),
              labelText: 'UserName',
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: _fieldController.nameController,
              hintText: 'Enter Name',
              fillColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
