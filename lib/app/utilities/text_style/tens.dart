
import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:google_fonts/google_fonts.dart';

class Ten400AppBackgroundWhite extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Ten400AppBackgroundWhite(
      {Key? key,
      required this.text,
      this.alignment,
      this.decoration,
      this.decorationColor,
      this.decorationStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            color: AppColors.AppBackgroundWhite,
            fontSize: sizeFit(false, 10, context),
            fontWeight: FontWeight.w400));
  }
}

class Ten400AppAsh extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Ten400AppAsh(
      {Key? key,
      required this.text,
      this.alignment,
      this.decoration,
      this.decorationColor,
      this.decorationStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            color: AppColors.AppAsh,
            fontSize: sizeFit(false, 10, context),
            fontWeight: FontWeight.w400));
  }
}

class Ten500AppBrightBlue extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Ten500AppBrightBlue(
      {Key? key,
      required this.text,
      this.alignment,
      this.decoration,
      this.decorationColor,
      this.decorationStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            color: AppColors.AppBlack,
            fontSize: sizeFit(false, 10, context),
            fontWeight: FontWeight.w500));
  }
}
class Ten500AppPrimaryPink extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Ten500AppPrimaryPink(
      {Key? key,
      required this.text,
      this.alignment,
      this.decoration,
      this.decorationColor,
      this.decorationStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            color: AppDarkColors.AppPrimaryPink,
            fontSize: sizeFit(false, 10, context),
            fontWeight: FontWeight.w500));
  }
}

class Ten500AppBlack extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Ten500AppBlack(
      {Key? key,
      required this.text,
      this.alignment,
      this.decoration,
      this.decorationColor,
      this.decorationStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            decoration: decoration,
            decorationColor: decorationColor,
            decorationStyle: decorationStyle,
            color: AppColors.AppBlack,
            fontSize: sizeFit(false, 10, context),
            fontWeight: FontWeight.w400));
  }
}


class Ten600AppYellow extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Ten600AppYellow({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.left,
      style: GoogleFonts.nunito(
          color: AppColors.AppYellow,
          fontSize: sizeFit(false, 10, context),
          fontWeight: FontWeight.w600),
    );
  }
}

class Ten600AppGreen extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Ten600AppGreen({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.left,
      style: GoogleFonts.nunito(
          color: AppColors.AppGreen,
          fontSize: sizeFit(false, 10, context),
          fontWeight: FontWeight.w600),
    );
  }
}

class Ten600AppRed extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Ten600AppRed({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.left,
      style: GoogleFonts.nunito(
          color: AppColors.AppDarkPink,
          fontSize: sizeFit(false, 10, context),
          fontWeight: FontWeight.w600),
    );
  }
}
