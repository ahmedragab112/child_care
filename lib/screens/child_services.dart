import 'dart:io';

import 'package:childcare/function/spaceing.dart';
import 'package:childcare/model/child_data.dart';
import 'package:childcare/model/services_model.dart';
import 'package:childcare/routes/app_routes.dart';
import 'package:childcare/widget/childer_services_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChildServices extends StatefulWidget {
  const ChildServices({super.key});

  @override
  State<ChildServices> createState() => _ChildServicesState();
}

class _ChildServicesState extends State<ChildServices> {
  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as ChildData;
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
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    color: Color(
                      0xff97D04D,
                    ),
                    width: 2,
                  ),
                ),
              ),
              child: BottomNavigationBar(
                  currentIndex: 0,
                  unselectedItemColor: Colors.black,
                  selectedItemColor: Colors.black,
                  onTap: (value) {},
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined, size: 64),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                            AssetImage(
                              "assets/images/child.png",
                            ),
                            size: 64),
                        label: "Child"),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage("assets/images/mom.png"),
                          size: 64,
                        ),
                        label: "Mom"),
                    BottomNavigationBarItem(
                        icon: ImageIcon(AssetImage("assets/images/info.png"),
                            size: 64),
                        label: "Info"),
                  ]),
            ),
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
                        child: Image.asset(
                          'assets/images/arrow_back.png',
                          width: 58.w,
                          height: 58.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Text(
                        'اضافة خدمة ',
                        style: GoogleFonts.inter(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox.shrink()
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: verticalSpace(50),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundImage: FileImage(File(data.imge)),
                              radius: 40,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'احمد',
                                  style: GoogleFonts.inter(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                verticalSpace(10),
                                Text(
                                  '${data.age} سنوات',
                                  style: GoogleFonts.inter(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: const Color(0xff97D04D),
                          endIndent: 20.w,
                          indent: 20.w,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverGrid.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.pushNamed(context, AppRoutes.sleepPage);
                      } else if (index == services.length - 1) {
                        Navigator.pushNamed(context, AppRoutes.medican);
                      }
                    },
                    child: ChildService(
                      image: services[index].imagee,
                      name: services[index].name,
                    ),
                  ),
                  itemCount: services.length,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
