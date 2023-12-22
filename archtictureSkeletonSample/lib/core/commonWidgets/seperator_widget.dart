import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SeparatorWidget extends StatelessWidget {
  const SeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width*0.44,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Colors.white.withOpacity(0.800000011920929),
              ),
            ),
          ),
        ),
        Container(
          width: 24,
          height: 24,
          decoration: ShapeDecoration(
            shape: OvalBorder(
              side: BorderSide(
                width: 1,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Colors.white.withOpacity(0.800000011920929),
              ),
            ),
          ),
          child: SizedBox(
            width: 16,
            height: 10,
            child: Center(
              child: Text(
                'OR',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.800000011920929),
                  fontSize: 12,
                  fontFamily: 'Bahij TheSansArabic',
                  fontWeight: FontWeight.w500,

                ),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.44,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 0.50,
                strokeAlign: BorderSide.strokeAlignCenter,
                color: Colors.white.withOpacity(0.800000011920929),
              ),
            ),
          ),
        )
      ],
    );
  }
}
