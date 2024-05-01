import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainter extends StatelessWidget {
  const CustomContainter(
      {super.key, this.onTap, required this.txt1, required this.txt2});
  final String txt1;
  final String txt2;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 52.h,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xff626161),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text('$txt1$txt2')],
        ),
      ),
    );
  }
}
