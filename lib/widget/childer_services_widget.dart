import 'package:childcare/function/spaceing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChildService extends StatelessWidget {
  const ChildService(
      {super.key, required this.name, required this.image, this.x = false});
  final String name;
  final String image;
  final bool x;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              width: 87.w,
              height: 85.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:
                    DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
              ),
            ),
            const Positioned(
              bottom: -8,
              child: Icon(
                Icons.add,
                color: Colors.black,
                fill: 1,
                size: 50,
              ),
            )
          ],
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
    );
  }
}
