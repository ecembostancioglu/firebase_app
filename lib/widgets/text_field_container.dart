
import 'package:flutter/material.dart';

import '../constants/app_color_constants.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        width: size.width*0.8,
        height: size.height/18,
        decoration: BoxDecoration(
          color: AppColorConstants.teal_shade200,
          borderRadius: BorderRadius.circular(29),
        ),
        child: child,

      ),
    );
  }
}