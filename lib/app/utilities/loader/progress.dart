import 'package:flutter/material.dart';
import 'package:fos/app/utilities/colors/app_colors.dart';
import 'package:fos/app/utilities/responsive/size_fit.dart';

class ProgressWidget extends StatelessWidget {
  const ProgressWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: sizeFit(false, 50, context),
        width: sizeFit(false, 50, context),
        child: const CircularProgressIndicator(
          backgroundColor: AppColors.AppCircularProgressLightBlue,
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.AppPink),
          strokeWidth: 2,
        ),
      ),
    );
  }
}
