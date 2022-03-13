
import 'package:firebase_ble/widgets/text_field_container.dart';
import 'package:flutter/material.dart';


class RoundedConfirmPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedConfirmPasswordField({
    Key? key,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextFieldContainer(
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            hintText:'Confirm Password',
            icon: Icon(Icons.lock,
                color: Colors.black54),
            suffixIcon: Icon(Icons.visibility,
                color: Colors.black54),
            border: InputBorder.none,
          ),
        ));
  }
}