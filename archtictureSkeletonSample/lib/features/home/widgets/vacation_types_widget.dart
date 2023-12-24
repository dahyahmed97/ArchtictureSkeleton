import 'package:archtictureskeletonsample/features/home/widgets/vacation_types_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/getVacationTypes/get_vacation_types_response_model.dart';

class VacationTypesWidget extends StatelessWidget {
  final List<VacationTypes> vacationTypes;
  const VacationTypesWidget({super.key, required this.vacationTypes});

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
            'Vacation Types',
            style: TextStyle(
              color: Color(0xFF444446),
              fontSize: 28.sp,
              fontFamily: 'Bahij TheSansArabic',
              fontWeight: FontWeight.w500,

            ),
          ),
          SizedBox(height: 32.h,),
          SizedBox(
            height: 230.h,
            child: ListView.builder(
                padding: EdgeInsetsDirectional.all(5),
                itemCount: vacationTypes.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context,index){
                  return VacationTypesListItem(vacationTypes: vacationTypes[index]);
                }),
          )
        ],
      ),
    );
  }
}
