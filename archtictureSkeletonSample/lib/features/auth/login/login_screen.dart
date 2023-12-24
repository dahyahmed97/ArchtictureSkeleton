import 'package:archtictureskeletonsample/core/commonWidgets/CustomTextField.dart';
import 'package:archtictureskeletonsample/core/commonWidgets/loading_widget.dart';
import 'package:archtictureskeletonsample/core/localization/localization.dart';
import 'package:archtictureskeletonsample/core/navigation/routes_catalog.dart';
import 'package:archtictureskeletonsample/core/styleUtils/assetCatalog.dart';
import 'package:archtictureskeletonsample/core/styleUtils/textStyleCatalog.dart';
import 'package:archtictureskeletonsample/features/auth/login/viewModel/login_screen_state.dart';
import 'package:archtictureskeletonsample/features/auth/login/viewModel/login_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/commonWidgets/customButton.dart';
import '../../../core/commonWidgets/seperator_widget.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameTextEditingController=TextEditingController();
  final TextEditingController _passwordTextEditingController=TextEditingController();
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
              return const LoadingWidget();
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
                            SizedBox(height: 40.h,),
                            Text(AppLocalizations.of(context)!.translate("welcomeText"),
                              style: TextStyleCatalog.titleTextStyle,),
                            SizedBox(height: 10.h,),
                            Text(AppLocalizations.of(context)!.translate("welcomeSubtitle"),
                              style: TextStyleCatalog.titleTextStyle.copyWith(fontSize: 18.sp),),
                            SizedBox(height: 55.h,),
                            Form(
                              key:_formKey ,
                              child: CustomTextFormField(
                                  str: AppLocalizations.of(context)!.translate("username"),
                                  suffixIcon: const SizedBox(width: 0,height: 0,),
                                controller: _usernameTextEditingController,
                                validate: (String? value){
                                    return context.read<LoginScreenViewModel>().validateUsername(value!);
                              },
                              ),
                            ),
                            SizedBox(height: 60.h,),
                            CustomTextFormField(
                              str: AppLocalizations.of(context)!.translate("password"),
                              isPassword: true,
                              suffixIcon: const SizedBox(width: 0,height: 0,),
                              controller: _passwordTextEditingController,
                              validate: (String? value){
                                return context.read<LoginScreenViewModel>().validatePassword(value!);
                              },
                            ),
                            SizedBox(height: 60.h,),
                            Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 16.w),
                              child: CustomButton(
                                onClick: () {
                                  if(_formKey.currentState!.validate()){
                                    context.read<LoginScreenViewModel>()
                                        .performLogin(_usernameTextEditingController.text, _passwordTextEditingController.text);
                                  }
                                },
                                icon: AssetCatalog.arrow,
                                title: 'Login',),
                            ),
                            SizedBox(height: 50.h,),
                            const SeparatorWidget(),
                            SizedBox(height: 25.h,),
                            Text(
                              AppLocalizations.of(context)!.translate("faceIdText"),
                              textAlign: TextAlign.center,
                              style: TextStyleCatalog.smallTitleStyle
                            ),
                            SizedBox(height: 8.h,),
                            SvgPicture.asset(AssetCatalog.faceId),
                            SizedBox(height: 45.h,),
                            Text(
                              'Copyright - Ejada Systems Ltd. 1444 AH - 2023\n Version 1.0.0',
                              textAlign: TextAlign.center,
                              style: TextStyleCatalog.smallLabelStyle
                            ),
                            SizedBox(height: 50.h,),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
          listener: (context,state){
            if(state is LoginSuccessState){
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Login Success")));
              Navigator.of(context).pushReplacementNamed(RoutesCatalog.homeScreen,arguments: state.userData);
            }
          },
        )
      ),
    );
  }
}
