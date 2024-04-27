import 'dart:developer';

import 'package:childcare/function/spaceing.dart';
import 'package:childcare/manager/homecubit_cubit.dart';
import 'package:childcare/model/mom_data_model.dart';
import 'package:childcare/routes/app_routes.dart';
import 'package:childcare/widget/child_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Mom extends StatelessWidget {
  const Mom({super.key});

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
                'الجليسات',
                style: GoogleFonts.inter(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.black),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.addMomPage);
                },
                child: Image.asset(
                  'assets/images/add_mom.png',
                  height: 73.h,
                  width: 94.w,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: verticalSpace(143),
        ),
        BlocBuilder<HomeCubit, HomecubitState>(
          builder: (context, state) {
            List<MomDataMode> moms =
                BlocProvider.of<HomeCubit>(context).moms ?? [];
            log('${moms.length}');
            if (state is AddMomErrorState) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(state.errorMassage),
                ),
              );
            } else {
              return SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) => CustomIcon(
                        name: moms[index].name ?? '',
                        x: true,
                        y: false,
                        image: 'assets/images/mom.png',
                      ),
                  itemCount: moms.length);
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
