import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';

class AuthButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? boxColror;
  final Widget? leading;
  final Color? titleColor;
  final bool? isIdle;

  const AuthButton(
      {Key? key,
      this.isIdle = true,
      required this.title,
      required this.onTap,
      this.boxColror,
      this.leading,
      this.titleColor})
      : super(key: key);

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Offstage(
                offstage: isIdle!,
                child: Row(
                  children: [
                    SizedBox(
                      height: sizeFit(false, 15, context),
                      width: sizeFit(false, 15, context),
                      child: const CircularProgressIndicator(
                        backgroundColor: AppColors.AppCircularProgressLightBlue,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2,
                      ),
                    ),
                    SizedBox(
                      width: sizeFit(true, 18, context),
                    ),
                  ],
                ),
              ),
              leading ?? const SizedBox(),
              leading != null
                  ? SizedBox(
                      width: sizeFit(true, 8, context),
                    )
                  : const SizedBox(),
              Center(
                child: Text(
                  title,
                  style: AppTextStyles.Sixteen400White,
                ),
              ),
            ],
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

class ConfirmDeliveryButton extends StatelessWidget {
  final Widget? leading;
  final bool? isIdle;
  final void Function() onTap;
  const ConfirmDeliveryButton({
    Key? key,
    this.leading,
    required this.onTap,
    this.isIdle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: sizeFit(false, 46, context),
        width: sizeFit(true, 343, context),
        decoration: BoxDecoration(
          color: AppColors.AppRed,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Offstage(
                offstage: isIdle!,
                child: Row(
                  children: [
                    SizedBox(
                      height: sizeFit(false, 15, context),
                      width: sizeFit(false, 15, context),
                      child: const CircularProgressIndicator(
                        backgroundColor: AppColors.AppCircularProgressLightBlue,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 2,
                      ),
                    ),
                    SizedBox(
                      width: sizeFit(true, 18, context),
                    ),
                  ],
                ),
              ),
              leading ?? const SizedBox(),
              leading != null
                  ? SizedBox(
                      width: sizeFit(true, 8, context),
                    )
                  : const SizedBox(),
              Text(
                'Confirm delivery',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.AppBackgroundWhite,
                  fontSize: sizeFit(false, 16, context),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
