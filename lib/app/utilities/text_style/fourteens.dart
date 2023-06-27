import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:google_fonts/google_fonts.dart';

class Fourteen400AppGreyMont extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen400AppGreyMont({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.montserrat(
            color: AppColors.AppGrey,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w400));
  }
}

class Sixteen500AppBlackMont extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Sixteen500AppBlackMont({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.montserrat(
            color: AppColors.AppBlack,
            fontSize: sizeFit(false, 16, context),
            fontWeight: FontWeight.w500));
  }
}

class Fourteen400AppGreyNun extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen400AppGreyNun({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            color: AppColors.AppGrey,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w400));
  }
}

class Fourteen400AppLightGreyNun extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen400AppLightGreyNun(
      {Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            color: AppColors.AppLightGrey,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w400));
  }
}

class Fourteen600AppBlueNun extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen600AppBlueNun({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            color: AppColors.AppLightBlue,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w600));
  }
}

class Fourteen600AppBlackNun extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen600AppBlackNun({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            color: AppColors.AppBlack,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w600));
  }
}

class Fourteen400AppBlackNun extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextOverflow? overflow;
  const Fourteen400AppBlackNun(
      {Key? key, required this.text, this.alignment, this.overflow})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: overflow ?? TextOverflow.ellipsis,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            color: AppColors.AppBlackTwo,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w400));
  }
}

class Fourteen400AppBackgroundWhiteNun extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen400AppBackgroundWhiteNun(
      {Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            color: AppColors.AppBackgroundWhite,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w400));
  }
}

class Fourteen500AppLightBlueNun extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen500AppLightBlueNun(
      {Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            color: AppColors.AppLightBlue,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w500));
  }
}

class Fourteen400AppBackgroundBlueNun extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen400AppBackgroundBlueNun(
      {Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            color: AppColors.AppBackgroundBlue,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w400));
  }
}

class Fourteen500AppGreyNun extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen500AppGreyNun({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.nunito(
            color: AppColors.AppGrey,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w500));
  }
}

class Fourteen500AppBlackNun extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen500AppBlackNun({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: 2,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.montserrat(
            color: AppColors.AppBlack,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w500));
  }
}

class Fourteen500AppWhite extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen500AppWhite({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.montserrat(
            color: AppColors.AppBackgroundWhite,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w500));
  }
}

class Fourteen500AppBlueNun extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen500AppBlueNun({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.montserrat(
            color: AppColors.AppLightBlue,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w500));
  }
}

class Fourteen500AppBackgroundBlueNun extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen500AppBackgroundBlueNun(
      {Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.montserrat(
            color: AppColors.AppBackgroundBlue,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w500));
  }
}

class Fourteen500AppMildBlueMont extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Fourteen500AppMildBlueMont(
      {Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.montserrat(
            color: AppColors.AppMildBlue,
            fontSize: sizeFit(false, 14, context),
            fontWeight: FontWeight.w500));
  }
}

class Sixteen500AppBlack extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Sixteen500AppBlack({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.montserrat(
            color: AppColors.AppMildBlue,
            fontSize: sizeFit(false, 16, context),
            fontWeight: FontWeight.w500));
  }
}

class Eighteen600AppBlack extends StatelessWidget {
  final String text;
  final TextAlign? alignment;

  const Eighteen600AppBlack({Key? key, required this.text, this.alignment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: alignment ?? TextAlign.left,
        style: GoogleFonts.montserrat(
            color: AppColors.AppBlack,
            fontSize: sizeFit(false, 18, context),
            fontWeight: FontWeight.w500));
  }
}

class Fourteen400AppAsh extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Fourteen400AppAsh(
      {Key? key,
      required this.text,
      this.alignment,
      this.decoration,
      this.decorationColor,
      this.decorationStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment ?? TextAlign.left,
      style: TextStyle(
          decoration: decoration,
          decorationColor: decorationColor,
          decorationStyle: decorationStyle,
          fontFamily: 'Nunito',
          color: AppColors.AppAsh,
          fontSize: sizeFit(false, 14, context),
          fontWeight: FontWeight.w400),
    );
  }
}


class Twelve500AppBlack extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Twelve500AppBlack(
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
            fontSize: sizeFit(false, 12, context),
            fontWeight: FontWeight.w500));
  }
}

class Twelve400AppAsh extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Twelve400AppAsh(
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
            fontSize: sizeFit(false, 12, context),
            fontWeight: FontWeight.w400));
  }
}

class Twelve600AppAsh extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Twelve600AppAsh(
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
            fontSize: sizeFit(false, 12, context),
            fontWeight: FontWeight.w600));
  }
}

class Twelve400AppWhite extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Twelve400AppWhite(
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
            fontSize: sizeFit(false, 12, context),
            fontWeight: FontWeight.w400));
  }
}

class Twelve400AppBlack extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Twelve400AppBlack(
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
            fontSize: sizeFit(false, 12, context),
            fontWeight: FontWeight.w400));
  }
}

class Twelve600AppBlack extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Twelve600AppBlack(
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
            fontSize: sizeFit(false, 12, context),
            fontWeight: FontWeight.w600));
  }
}

class Twelve400AppRed extends StatelessWidget {
  final String text;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextDecorationStyle? decorationStyle;

  const Twelve400AppRed(
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
            color: AppColors.AppRedText,
            fontSize: sizeFit(false, 12, context),
            fontWeight: FontWeight.w400));
  }
}

