import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_color.dart';

class CustomFavoriteIcon extends StatelessWidget {
  const CustomFavoriteIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      child: Card(
        elevation: 5,
        shape: CircleBorder(),
        child: Container(
          height: 35.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            alignment: Alignment.center,
            onPressed: () {},
            icon: Icon(
              Icons.favorite_border_rounded,
              size: 30.r,
              color: AppColors.kAddToCartIconColor,
            ),
          ),
        ),
      ),
    );
  }
}
