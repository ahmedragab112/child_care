import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.text,
      required this.controller,
      this.keyBoardType = TextInputType.text, this.prefixIcon, this.onTap});
  final String text;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final Widget? prefixIcon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap:onTap ,
      keyboardType: keyBoardType,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        prefixIcon:prefixIcon,
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Text(
            text,
            style:
                GoogleFonts.inter(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
