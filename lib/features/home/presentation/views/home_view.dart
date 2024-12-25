import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/features/home/presentation/view_model/cubit/get_product_cubit.dart';
import 'package:store_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  @override
  void initState() {
    BlocProvider.of<GetProductCubit>(context).getAllProduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody()
    );
  }
}
