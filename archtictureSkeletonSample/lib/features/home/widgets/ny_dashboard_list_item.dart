import 'package:archtictureskeletonsample/features/home/models/getVacationTypes/get_vacation_types_response_model.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/getEmpVacationTypes/get_emp_vacation_types_response_model.dart';
import 'color_tile_widget.dart';

class MyDashBoardListItem extends StatelessWidget {
  final VacationType vacation;
  const MyDashBoardListItem({super.key, required  this.vacation});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatedCircularChartState> chartKey = GlobalKey<AnimatedCircularChartState>();
    return Container(

      margin: EdgeInsetsDirectional.only(end: 20.w),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w,vertical: 16.h),
      width: 222.w,
      height: 214.h,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            color: const Color(0x1E000000),
            blurRadius: 10.r,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                vacation.description!,
                style: TextStyle(
                  color: Color(0xFF444446),
                  fontSize: 15.sp,
                  fontFamily: 'Bahij TheSansArabic',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          AnimatedCircularChart(
            holeLabel:((vacation.usedValue!/vacation.value!)*100).roundToDouble().toString()+"%",
            key: chartKey,
            size: Size(120.w, 120.h),
            initialChartData: <CircularStackEntry>[
              CircularStackEntry(
                <CircularSegmentEntry>[
                  CircularSegmentEntry(
                   vacation.usedValue!.toDouble(),
                   hexStringToColor(vacation.outerColor!),
                    rankKey: 'used',
                  ),
                  CircularSegmentEntry(
                    (vacation.value!-vacation.usedValue!).toDouble(),
                    const Color(0xFFF2F2F7),
                    rankKey: 'remaining',
                  ),
                ],
                rankKey: 'progress',
              ),
            ],

            chartType: CircularChartType.Radial,
            edgeStyle: SegmentEdgeStyle.round,
            percentageValues: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            ColorTileWidget(color:const Color(0xFFF2F2F7), title:"Total:${vacation.value!} Day ",),
            ColorTileWidget(color:hexStringToColor(vacation.outerColor!), title:"Used:${vacation.usedValue!} Day ",)
          ],),
        ],
      ),
    );
  }
}

hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16));
}