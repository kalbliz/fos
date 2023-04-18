// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fos/app/modules/auth/views/auth_view.dart';
import 'package:fos/app/utilities/buttons/auth_button.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  const ErrorDialog({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      actions: [
        AuthButton(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'OK',
          boxColror: AppDarkColors.AppRed,
        )
      ],
    );
  }
}
