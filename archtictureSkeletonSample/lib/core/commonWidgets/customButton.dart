import 'package:archtictureskeletonsample/core/styleUtils/colorCatalog.dart';
import 'package:archtictureskeletonsample/core/styleUtils/textStyleCatalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {
  final Function() onClick;
  final String icon;
  final String title;
  const CustomButton({super.key, required this.onClick, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child:Container(
        width: MediaQuery.of(context).size.width,
        height: 60.h,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 24,vertical: 16),
        decoration: ShapeDecoration(
          color:ColorsCatalog.teal,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style:TextStyleCatalog.buttonTextStyle ,),
            SvgPicture.asset(icon)
          ],
        ),
      ) ,
    );
  }
}
