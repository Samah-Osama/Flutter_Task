import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/utils/widgets/custom_error_widget.dart';
import 'package:store_app/features/home/presentation/view_model/cubit/get_product_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/product_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductCubit, GetProductState>(
      builder: (context, state) {
        if (state is GetProductSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            child: GridView.builder(
              itemCount: state.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 190 / 240,
                mainAxisSpacing: 8.h,
                crossAxisSpacing: 12.w,
              ),
              itemBuilder: (context, index) {
                return ProductWidget(productModel: state.products[index]);
              },
            ),
          );
        } else if (state is GetProductFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
