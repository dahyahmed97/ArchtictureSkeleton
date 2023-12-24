
import 'package:archtictureskeletonsample/features/home/models/getVacationTypes/get_vacation_types_response_model.dart';
import 'package:archtictureskeletonsample/features/home/widgets/ny_dashboard_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VacationTypesListItem extends StatelessWidget {
 final VacationTypes vacationTypes;
  const VacationTypesListItem({super.key, required this.vacationTypes});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 207.w,
      height: 163.h,
      margin: EdgeInsetsDirectional.only(end: 20.w),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w,vertical: 16.h),
      decoration: ShapeDecoration(
        color: hexStringToColor(vacationTypes.outerColor!),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
    );
  }
}
