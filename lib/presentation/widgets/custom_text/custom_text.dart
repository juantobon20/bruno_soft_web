import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../configs/config.dart';
import '../custom_text_font.dart';

class CustomText extends StatelessWidget {

  final String text;
  final TextStyle textStyle;

  const CustomText({
    super.key,
    required this.text,
    required this.textStyle 
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
    );
  }
}

CustomText _customText({
  required String text,
  required TextStyle textStyle
}) => CustomText(
  text: text, 
  textStyle: textStyle
);

CustomText titleText({ 
  required String text,
  Color? textColor
}) => _customText(
  text: text, 
  textStyle: CustomTextFont.titleStyle.copyWith(color: textColor)
);

CustomText primaryText({ 
  required String text,
  Color textColor = CustomColors.primaryText
}) => _customText(
  text: text, 
  textStyle: CustomTextFont.primaryStyle.copyWith(color: textColor)
);

CustomText secondaryText({ 
  required String text,
  Color textColor = CustomColors.secondaryText
}) => _customText(
  text: text, 
  textStyle: CustomTextFont.secondaryStyle.copyWith(color: textColor)
);

CustomText tertiaryText({ 
  required String text,
  Color textColor = CustomColors.tertiaryText
}) => _customText(
  text: text, 
  textStyle: CustomTextFont.tertiaryStyle.copyWith(color: textColor)
);