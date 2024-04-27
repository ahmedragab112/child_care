import 'package:childcare/function/spaceing.dart';
import 'package:childcare/widget/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Medisent extends StatelessWidget {
  const Medisent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/images/arrow_back.png',
                              width: 58.w, height: 58.h, fit: BoxFit.fill),
                        ),
                        Text(
                          'اضافة خدمة ',
                          style: GoogleFonts.inter(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                        ),
                        const SizedBox.shrink()
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: verticalSpace(112),
                  ),
                  const SliverToBoxAdapter(
                    child: Divider(
                      color: Color(0xff97D04D),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'الدواء',
                          style: GoogleFonts.inter(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(20),
                        CustomTextFiled(
                            text: 'اسم الدواء:',
                            controller: TextEditingController()),
                        verticalSpace(20),
                        CustomTextFiled(
                            text: 'الجرعه:',
                            controller: TextEditingController()),
                        verticalSpace(20),
                        CustomTextFiled(
                            text: 'الساعه:',
                            controller: TextEditingController()),
                        verticalSpace(20),
                        CustomTextFiled(
                          text: 'ملاحظات:',
                          controller: TextEditingController(),
                        ),
                        verticalSpace(40),
                        Container(
                          width: double.infinity,
                          height: 52.h,
                          decoration: const BoxDecoration(
                            color: Color(0xff97D04D),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.black,
                                    size: 30,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.check_circle,
                                    color: Colors.black,
                                    size: 30,
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
