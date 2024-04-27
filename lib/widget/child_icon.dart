import 'dart:io';

import 'package:childcare/function/spaceing.dart';
import 'package:childcare/model/child_data.dart';
import 'package:childcare/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon(
      {super.key,
      this.x = false,
      this.y = true,
      this.data,
      required this.image, required this.name});
  final ChildData? data;
  final String image;
  final String name;
  final bool y;
  final bool x;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        x == false
            ? Navigator.pushNamed(context, AppRoutes.addChildServices,
                arguments: data)
            : Navigator.pushNamed(context, AppRoutes.addMomPage);
      },
      child: Center(
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 87.w,
                  height: 85.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: y == true
                        ? DecorationImage(
                            image: FileImage(File(data!.imge)),
                            fit: BoxFit.fill)
                        : DecorationImage(
                            image: AssetImage(image), fit: BoxFit.fill),
                  ),
                ),
                verticalSpace(6),
                Text(
                  name,
                  style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            x == true
                ? const SizedBox.shrink()
                : Positioned(
                    left: 10.w,
                    top: -5.h,
                    child: Image.asset(
                      'assets/images/edit.png',
                      width: 37.w,
                      height: 39.h,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
