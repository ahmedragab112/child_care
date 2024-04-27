import 'package:childcare/function/spaceing.dart';
import 'package:childcare/widget/custom_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SleepTime extends StatefulWidget {
  const SleepTime({super.key});

  @override
  State<SleepTime> createState() => _SleepTimeState();
}

class _SleepTimeState extends State<SleepTime> {
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
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
                          'النوم ',
                          style: GoogleFonts.inter(
                              fontSize: 25.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(20),
                        CustomTextFiled(
                          text: 'من',
                          controller: fromController,
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                maxTime: DateTime(2040, 1, 1),
                                onChanged: (date) {}, onConfirm: (date) {
                              fromDate = date;
                              setState(() {
                                fromController.text =
                                    DateFormat.jm().format(fromDate);
                              });
                            }, currentTime: DateTime.now());
                          },
                        ),
                        verticalSpace(20),
                        CustomTextFiled(
                          text: 'الي',
                          controller: toController,
                          onTap: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime.now(),
                                maxTime: DateTime(2040, 1, 1),
                                onChanged: (date) {}, onConfirm: (date) {
                              toDate = date;
                              setState(() {
                                toController.text =
                                    DateFormat.jm().format(toDate);
                              });
                            }, currentTime: DateTime.now());
                          },
                        ),
                        verticalSpace(20),
                        Container(
                          width: double.infinity,
                          height: 52.h,
                          decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                vertical: BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                )),
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
                                ),
                              ),
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
