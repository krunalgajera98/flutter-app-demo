import 'package:demo_flutter/Widgets/text_form_feild.dart';
import 'package:flutter/material.dart';

class TextFieldUI extends StatelessWidget {
  static const routeName = '/TextFieldUI';

  TextFieldUI({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              controller: _nameController,
              keyboardType: TextInputType.name,
              focusNode: FocusNode(),
              labelText: 'UserName',
              obscureText: false,
              validator: (val) {
                return null;
              },
              suffixIconTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
