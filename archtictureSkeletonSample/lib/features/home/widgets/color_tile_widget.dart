import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorTileWidget extends StatelessWidget {
  final Color color;
  final String title;
  const ColorTileWidget({super.key, required this.color, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: ShapeDecoration(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        SizedBox(width: 5.w,),
        Text(
          title,
          style: TextStyle(
            color: Color(0xFF48484A),
            fontSize: 12.sp,
            fontFamily: 'Bahij TheSansArabic',
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
