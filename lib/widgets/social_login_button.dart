import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {

  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final double radius;
  final double buttonHeight;
  final double buttonWidth;
  final Widget buttonIcon;
  final VoidCallback onPressed;

  const SocialLoginButton({Key? key,
    required this.buttonText, required this.buttonColor, required this.textColor, required this.radius,
    required this.buttonHeight, required this.buttonWidth,required this.buttonIcon, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(240, 40),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          primary:buttonColor,
        ),
        onPressed:onPressed,
        child: Row(
          children: [
            buttonIcon,
            SizedBox(
              width: 10,
            ),
            Text(buttonText,
              style: TextStyle(color: textColor),),
          ],
        )
    );
  }
}