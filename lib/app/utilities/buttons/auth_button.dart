import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? boxColror;

  const AuthButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.boxColror,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: sizeFit(false, 48, context),
        width: sizeFit(true, 206, context),
        decoration: BoxDecoration(
            color: boxColror ?? AppDarkColors.AppPrimaryPink,
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            title,
            style: AppTextStyles.Sixteen400White,
          ),
        ),
      ),
    );
  }
}
class ActionButton extends StatelessWidget {
  final String action;
  void Function()? onTap;
  ActionButton({
    Key? key,
    required this.action,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: sizeFit(false, 50, context),
        width: sizeFit(true, 50, context),
        decoration: BoxDecoration(
            border: Border.all(
                color: action == 'accept'
                    ? AppDarkColors.AppGreen
                    : AppDarkColors.AppPrimaryPink),
            borderRadius: BorderRadius.circular(8)),
        child: Icon(
          action == 'accept' ? Icons.check : Icons.close,
          color: action == 'accept'
              ? AppDarkColors.AppGreen
              : AppDarkColors.AppPrimaryPink,
        ),
      ),
    );
  }
}
