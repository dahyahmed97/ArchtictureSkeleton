import 'package:archtictureskeletonsample/core/styleUtils/assetCatalog.dart';
import 'package:archtictureskeletonsample/core/styleUtils/textStyleCatalog.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TopAppBar extends StatelessWidget {
  final LoginResponseModel userData;
  const TopAppBar({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AssetCatalog.topBarBackground,fit: BoxFit.cover,),
        SafeArea(child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AssetCatalog.logoSmall),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AssetCatalog.notificationsIcon),
                    Row(
                      children: [
                        SvgPicture.asset(AssetCatalog.profileIcon),
                        SizedBox(width: 16.w,),
                        SvgPicture.asset(AssetCatalog.logoutIcon),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 30.h,),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome ${userData.username} ',
                      style:TextStyleCatalog.titleTextStyle.copyWith(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    Text(DateFormat("MMMM dd, yyyy").format(DateTime.now()),
                      style:TextStyleCatalog.buttonTextStyle ,)
                  ],
                ),
              )
            ],
          ),
        ))
      ],
    );
  }
}
