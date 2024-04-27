import 'package:childcare/function/spaceing.dart';
import 'package:childcare/manager/homecubit_cubit.dart';
import 'package:childcare/widget/build_image.dart';
import 'package:childcare/widget/custom_textfiled.dart';
import 'package:childcare/widget/image_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddChild extends StatefulWidget {
  const AddChild({super.key});

  @override
  State<AddChild> createState() => _AddChildState();
}

class _AddChildState extends State<AddChild> {
  bool isMeal = true;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomecubitState>(
      builder: (context, state) {
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
                body: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.h, horizontal: 6.w),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Image.asset(
                                'assets/images/arrow_back.png',
                                width: 58.w,
                                height: 58.h,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Text(
                              'اضافة طفل ',
                              style: GoogleFonts.inter(
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                            const SizedBox.shrink(),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: BuildImage(
                                  onTap: () {
                                    testDialog(context);
                                  },
                                )),
                            Divider(
                              color: const Color(0xff97D04D),
                              thickness: 1,
                              endIndent: 40.w,
                              indent: 40.w,
                            ),
                            verticalSpace(12),
                            CustomTextFiled(
                              text: ' : رقم الهويه  ',
                              keyBoardType: TextInputType.number,
                              controller: cubit.id,
                            ),
                            verticalSpace(12),
                            CustomTextFiled(
                              text: ' : الاسم  الاول',
                              controller: cubit.firstNameController,
                            ),
                            verticalSpace(12.h),
                            CustomTextFiled(
                              text: ' : الاسم الاخير',
                              controller: cubit.lastNameController,
                            ),
                            verticalSpace(7),
                            CustomTextFiled(
                              text: ' : العمر',
                              keyBoardType: TextInputType.number,
                              controller: cubit.ageController,
                            ),
                            verticalSpace(7),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    cubit.changeSex(false);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 110.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: cubit.isMeal
                                          ? Colors.white
                                          : const Color(0xff97D04D),
                                      borderRadius: BorderRadius.circular(15.r),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      'بنت ',
                                      style: GoogleFonts.inter(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                horizontalSpace(15),
                                GestureDetector(
                                  onTap: () {
                                    cubit.changeSex(true);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 110.w,
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      color: cubit.isMeal
                                          ? const Color(0xff97D04D)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(15.r),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    ),
                                    child: Text(
                                      'ذكر ',
                                      style: GoogleFonts.inter(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                horizontalSpace(15),
                                Text(
                                  ' : الجنس',
                                  style: GoogleFonts.inter(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            verticalSpace(20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                horizontalSpace(15),
                                GestureDetector(
                                  onTap: () async {
                                    showDatePicker(
                                            context: context,
                                            initialDate: selectedDate,
                                            firstDate: DateTime(2000, 1, 1),
                                            lastDate: DateTime.now())
                                        .then((value) {
                                      setState(() {
                                        selectedDate = value ?? DateTime.now();
                                        cubit.date = DateFormat('d MMMM yyyy')
                                            .format(selectedDate)
                                            .toString();
                                      });
                                    });
                                  },
                                  child: Text(
                                    cubit.date,
                                    style: GoogleFonts.inter(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.bold,
                                        color: const Color(0xff97D04D)),
                                  ),
                                ),
                                horizontalSpace(15),
                                Text(
                                  ' : التاريخ',
                                  style: GoogleFonts.inter(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            verticalSpace(12),
                            CustomTextFiled(
                              text: ' : فصيلة الدم',
                              controller: cubit.bloodTypeController,
                            ),
                            verticalSpace(12),
                            Divider(
                              color: const Color(0xff97D04D),
                              thickness: 1,
                              endIndent: 40.w,
                              indent: 40.w,
                            ),
                            Text(
                              'الوالدين ',
                              style: GoogleFonts.inter(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.end,
                            ),
                            verticalSpace(12),
                            CustomTextFiled(
                              text: ' : الاسم',
                              controller: cubit.fatherNameController,
                            ),
                            verticalSpace(12),
                            CustomTextFiled(
                              prefixIcon: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 12.h),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Text(
                                  '+966',
                                  style: GoogleFonts.inter(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              text: ' : الهاتف',
                              keyBoardType: TextInputType.phone,
                              controller: cubit.fatherPhoneController,
                            ),
                            verticalSpace(12),
                            GestureDetector(
                              onTap: () {
                                cubit.addchild();
                                Navigator.pop(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 47.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: const Color(0xff97D04D),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  'حفظ',
                                  style: GoogleFonts.inter(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
