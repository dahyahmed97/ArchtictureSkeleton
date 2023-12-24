import 'package:archtictureskeletonsample/features/home/models/getEmpVacationTypes/get_emp_vacation_types_response_model.dart';
import 'package:archtictureskeletonsample/features/home/widgets/ny_dashboard_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/getVacationTypes/get_vacation_types_response_model.dart';

class MyDashBoardWidget extends StatelessWidget {
  final List<VacationType> vacationTypesList;
  const MyDashBoardWidget({super.key, required this.vacationTypesList});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Dashboard',
            style: TextStyle(
              color: Color(0xFF444446),
              fontSize: 28.sp,
              fontFamily: 'Bahij TheSansArabic',
              fontWeight: FontWeight.w500,

            ),
          ),
          SizedBox(height: 32.h,),
          Container(
            padding: EdgeInsetsDirectional.symmetric(vertical: 5.h),
            height: 220.h,
            child: ListView.builder(
                padding: EdgeInsetsDirectional.all(5),
                itemCount: vacationTypesList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return MyDashBoardListItem(vacation:vacationTypesList[index]);
                }),
          )
        ],
      ),
    );
  }
}
