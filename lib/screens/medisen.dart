import 'package:childcare/function/spaceing.dart';
import 'package:childcare/widget/custom_textfiled.dart';
import 'package:childcare/widget/data_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Medisent extends StatefulWidget {
  const Medisent({super.key});

  @override
  State<Medisent> createState() => _MedisentState();
}

class _MedisentState extends State<Medisent> {
  String amoutOfMedisent = '';
  String time = '';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
              key: _scaffoldKey,
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
                            text: ' : اسم الدواء ',
                            controller: TextEditingController()),
                        verticalSpace(20),
                        CustomContainter(
                          txt1: ' : الجرعه',
                          txt2: amoutOfMedisent,
                          onTap: () {
                            Picker(
                              adapter: PickerDataAdapter<String?>(
                                data: List<PickerItem<String>>.generate(
                                  6,
                                  (index) => PickerItem(
                                    text: Text('$index'),
                                    children: [
                                      PickerItem(
                                        text: const Text('حبه'),
                                      ),
                                      PickerItem(
                                        text: const Text('ملي'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              changeToFirst: true,
                              textAlign: TextAlign.left,
                              columnPadding: const EdgeInsets.all(8.0),
                              onSelect:
                                  (Picker picker, int iteam, List<int> index) {
                                setState(() {
                                  amoutOfMedisent =
                                      '${picker.getSelectedValues()[0] ?? ''}        ${picker.getSelectedValues()[1] ?? ''}';
                                });
                              },
                              onConfirm: (Picker picker, List value) {},
                            ).show(_scaffoldKey.currentState!);
                          },
                        ),
                        verticalSpace(20),
                        CustomContainter(
                          txt1: ' : الساعه',
                          txt2: time,
                          onTap: () {
                            Picker(
                                    adapter: PickerDataAdapter<String?>(
                                        data: List<PickerItem<String>>.generate(
                                      30,
                                      (index) => PickerItem(
                                          text: Text(' ${index + 1} Set'),
                                          children:
                                              List<PickerItem<String>>.generate(
                                            30,
                                            (index) => PickerItem(
                                                text: Text('${index + 1}'),
                                                children: List<
                                                    PickerItem<
                                                        String>>.generate(
                                                  30,
                                                  (index) => PickerItem(
                                                      text:
                                                          Text('${index + 30}'),
                                                      children: [
                                                        PickerItem(
                                                            text: const Text(
                                                                'ص')),
                                                        PickerItem(
                                                            text:
                                                                const Text('م'))
                                                      ]),
                                                )),
                                          )),
                                    )),
                                    changeToFirst: true,
                                    textAlign: TextAlign.left,
                                    onSelect: (picker, index, selected) {
                                      time =
                                          '${picker.getSelectedValues()[0] ?? ''} ${picker.getSelectedValues()[1] ?? ''}${picker.getSelectedValues()[2] ?? ''}${picker.getSelectedValues()[3] ?? ''}';
                                      setState(() {});
                                    },
                                    columnPadding: const EdgeInsets.all(8.0),
                                    onConfirm: (Picker picker, List value) {})
                                .show(_scaffoldKey.currentState!);
                          },
                        ),
                        verticalSpace(20),
                        CustomTextFiled(
                            text: ' : ملاحظات',
                            controller: TextEditingController()),
                        verticalSpace(20),
                        Container(
                          width: double.infinity,
                          height: 52.h,
                          decoration: BoxDecoration(
                              color: const Color(0xff97D04D),
                              border:
                                  Border.all(color: Colors.black, width: 2)),
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
