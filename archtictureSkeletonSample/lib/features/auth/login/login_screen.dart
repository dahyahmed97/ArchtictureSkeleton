import 'package:archtictureskeletonsample/core/commonWidgets/CustomTextField.dart';
import 'package:archtictureskeletonsample/core/localization/localization.dart';
import 'package:archtictureskeletonsample/core/styleUtils/assetCatalog.dart';
import 'package:archtictureskeletonsample/core/styleUtils/textStyleCatalog.dart';
import 'package:archtictureskeletonsample/features/auth/login/viewModel/login_screen_state.dart';
import 'package:archtictureskeletonsample/features/auth/login/viewModel/login_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/commonWidgets/customButton.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController _usernameTextEditingController=TextEditingController();
  TextEditingController _passwordTextEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(AssetCatalog.backgroundImage))
        ),
        child: BlocConsumer<LoginScreenViewModel,LoginScreenState>(
          builder: (context,state){
            if(state is LoginScreenLoadingState){
              return Text("loading");
            }else{
              return SafeArea(
                bottom: false,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10.h,),
                      Image.asset(AssetCatalog.logo,),
                      SizedBox(height: 50.h,),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        height:  MediaQuery.of(context).size.height,
                        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
                        decoration: ShapeDecoration(
                          color: Colors.white.withOpacity(0.2199999988079071),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.r),
                              topRight: Radius.circular(40.r),
                            ),
                          ),
                          shadows: [
                            BoxShadow(
                              color: const Color(0x3F000000),
                              blurRadius: 4.r,
                              offset: const Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 60.h,),
                            Text(AppLocalizations.of(context)!.translate("welcomeText"),
                              style: TextStyleCatalog.titleTextStyle,),
                            SizedBox(height: 10.h,),
                            Text(AppLocalizations.of(context)!.translate("welcomeSubtitle"),
                              style: TextStyleCatalog.titleTextStyle.copyWith(fontSize: 18.sp),),
                            SizedBox(height: 85.h,),
                            CustomTextFormField(
                                str: "Username",
                                suffixIcon: Container(width: 0,height: 0,),
                              controller: _usernameTextEditingController,
                            ),
                            SizedBox(height: 60.h,),
                            CustomTextFormField(
                              str: "Password",
                              isPassword: true,
                              suffixIcon: Container(width: 0,height: 0,),
                              controller: _passwordTextEditingController,
                            ),
                            SizedBox(height: 60.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 16.w),
                              child: CustomButton(
                                onClick: () {  },
                                icon: AssetCatalog.arrow,
                                title: 'Login',),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
          listener: (context,state){},
        )
      ),
    );
  }
}
