import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../colors/app_colors.dart';


class NormalImageLoaderWidget extends StatelessWidget {
  const NormalImageLoaderWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: AppDarkColors.AppAsh,
        highlightColor: AppDarkColors.AppTextAsh,
        child: Image.asset(
          'assets/images/home/avatar.png',
          fit: BoxFit.cover,
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.error,
          color: AppDarkColors.AppAsh,
        ),
      ),
      fit: BoxFit.fitHeight,
    );
  }
}

class ImageLoaderWidget extends StatelessWidget {
  const ImageLoaderWidget({
    Key? key,
    required this.imageUrl,
    required this.radius,
  }) : super(key: key);

  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
        radius: radius,
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: AppColors.AppShimmerBaseColor,
        highlightColor: AppColors.AppShimmerHighlightColor,
        child: Image.asset(
          'assets/images/home/avatar.png',
          fit: BoxFit.cover,
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.error,
          color: AppColors.AppGrey,
        ),
      ),
      fit: BoxFit.cover,
    );
  }
}
