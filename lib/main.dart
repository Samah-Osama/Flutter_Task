import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_app/core/services/service_locator.dart';
import 'package:store_app/features/home/data/repos/home_repo.dart';
import 'package:store_app/features/home/presentation/view_model/cubit/get_product_cubit.dart';
import 'package:store_app/features/home/presentation/views/home_view.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      splitScreenMode: true,
      builder: (context, child) {
        ScreenUtil.init(context);
        return BlocProvider(
          create: (context) => GetProductCubit(getIt.get<HomeRepo>()),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomeView(),
          ),
        );
      },
    );
  }
}
