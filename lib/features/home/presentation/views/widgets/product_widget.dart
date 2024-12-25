import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/app_color.dart';
import 'package:store_app/features/home/data/models/product_model/product_model.dart';
import 'package:store_app/features/home/presentation/views/widgets/custom_favorite_icon.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.kProductCardBorderColor),
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 4.h, right: 15.w),
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      productModel.image ??
                          'https://demofree.sirv.com/nope-not-here.jpg',
                    ),
                  ),
                ),
                SizedBox(height: 9.h),
                Text(
                  productModel.title!.substring(0, 15),
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.kTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  productModel.description!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.kTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Text(
                  r'EGP'
                  ' ${productModel.price}',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.kTextColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Review (${productModel.rating?.count ?? 0})',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.kTextColor,
                          ),
                        ),
                        Icon(Icons.star, color: Colors.amber),
                      ],
                    ),

                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle,
                        size: 35,
                        color: AppColors.kAddToCartIconColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CustomFavoriteIcon(),
        ],
      ),
    );
  }
}
