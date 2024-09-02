import 'package:flutter/material.dart';
import 'package:i_travel/core/utils/app_styles.dart';
import 'package:i_travel/core/widgets/title_and_text_button.dart';

class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle({
    super.key,
    required this.subtitle,
    required this.title,
    required this.buttonTitle,
    this.onPressed,
  });

  final String title;
  final String subtitle;
  final String buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.styleBold30Black,
        ),
        TitleAndTextButton(
          title: subtitle,
          titleForButton: buttonTitle,
          onPressed: onPressed!,
        ),
      ],
    );
  }
}
