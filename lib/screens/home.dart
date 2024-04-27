import 'dart:developer';

import 'package:childcare/function/spaceing.dart';
import 'package:childcare/manager/homecubit_cubit.dart';
import 'package:childcare/model/child_data.dart';
import 'package:childcare/model/child_data_model.dart';
import 'package:childcare/routes/app_routes.dart';
import 'package:childcare/widget/child_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().displayChilds();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox.shrink(),
              Text(
                'الاطفال',
                style: GoogleFonts.inter(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.addChildPage);
                },
                child: Image.asset(
                  'assets/images/add_child.png',
                  width: 100.w,
                  height: 80.h,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: verticalSpace(145),
        ),
        SliverToBoxAdapter(
          child: Divider(
            color: const Color(0xff97D04D),
            thickness: 1,
            endIndent: 40.w,
            indent: 40.w,
          ),
        ),
        SliverToBoxAdapter(
          child: verticalSpace(57),
        ),
        BlocBuilder<HomeCubit, HomecubitState>(
          builder: (context, state) {
            List<ChildDataModel> childs =
                BlocProvider.of<HomeCubit>(context).childes ?? [];
            log('${childs.length}');

            if (state is AddLoading) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is AddChildErrorState) {
              return SliverToBoxAdapter(
                child: Text(state.errorMassage),
              );
            } else {
              return SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => CustomIcon(
                        name: childs[index].name ?? '',
                        
                        image: childs[index].imagePath ?? '',
                        data: ChildData(
                            name: childs[index].name ?? '',
                            age: childs[index].age ?? '',
                            imge: childs[index].imagePath ?? ''),
                      ),
                  itemCount: childs.length);
            }
          },
        ),
        SliverToBoxAdapter(
          child: verticalSpace(27),
        ),
      ],
    );
  }
}
