
import 'package:firebase_ble/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

import '../constants/app_color_constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextFieldContainer(
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText:'Password',
            icon: Icon(Icons.lock,
                color: AppColorConstants.black54),
            suffixIcon: Icon(Icons.visibility,
                color: AppColorConstants.black54),
            border: InputBorder.none,
          ),
        ));
  }
}