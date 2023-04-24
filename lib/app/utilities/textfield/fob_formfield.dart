import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';
import 'package:fos/app/utilities/text_style/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class FosTextFieldWidget extends StatelessWidget {
  final String hintText;
  final String? titleText;
  final TextEditingController? textEditingController;
  final bool? autofocus;
  final String? errorText;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final bool? obscureText;
  final bool? readOnly;
  final bool enabled;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final AutovalidateMode? autoValidateMode;

  const FosTextFieldWidget(
      {Key? key,
      required this.hintText,
      this.textEditingController,
      this.autofocus,
      this.maxLines,
      this.errorText,
      this.validator,
      this.obscureText,
      this.suffixIcon,
      this.textInputType,
      this.titleText,
      this.inputFormatters,
      this.onChanged,
      this.enabled = true,
      this.prefixIcon,
      this.readOnly,
      this.maxLength,
      this.autoValidateMode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleText != null
            ? Text(
                titleText!,
                style: AppTextStyles.Fourteen400TextAsh,
              )
            : Container(),
        SizedBox(
          height: sizeFit(false, 4, context),
        ),
        TextFormField(
          autovalidateMode: autoValidateMode,
          maxLength: maxLength,
          readOnly: readOnly ?? false,
          maxLines: maxLines,
          controller: textEditingController,
          cursorColor: AppDarkColors.AppTextBlack,
          autofocus: autofocus ?? false,
          obscureText: obscureText ?? false,
          keyboardType: textInputType,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          enabled: enabled,
          style: GoogleFonts.nunito(
              fontSize: sizeFit(false, 14, context),
              color: AppDarkColors.AppTextBlack,
              fontWeight: FontWeight.w500),
          validator: validator,
          decoration: InputDecoration(
              filled: false,
              prefixIcon: prefixIcon,
              fillColor: AppDarkColors.AppTextAsh,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: sizeFit(true, 16, context),
                  vertical: sizeFit(false, 0, context)),
              // suffixIcon: suffixIcon,
              suffix: suffixIcon,
              hintText: hintText,
              hintStyle: GoogleFonts.nunito(
                color: AppDarkColors.AppTextAsh,
                fontSize: sizeFit(false, 14, context),
                fontWeight: FontWeight.w400,
              ),
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(),
              focusedBorder: UnderlineInputBorder(),
              focusColor: AppDarkColors.AppPrimaryPink,
              hoverColor: AppDarkColors.AppPrimaryPink,
              errorBorder: UnderlineInputBorder()),
        ),
      ],
    );
  }
}
