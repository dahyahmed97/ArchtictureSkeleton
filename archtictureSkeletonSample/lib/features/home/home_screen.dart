import 'package:archtictureskeletonsample/core/commonWidgets/loading_widget.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_response_model.dart';
import 'package:archtictureskeletonsample/features/home/viewModel/home_screen_state.dart';
import 'package:archtictureskeletonsample/features/home/viewModel/home_view_model.dart';
import 'package:archtictureskeletonsample/features/home/widgets/TopAppBar.dart';
import 'package:archtictureskeletonsample/features/home/widgets/my_dashboard_widget.dart';
import 'package:archtictureskeletonsample/features/home/widgets/vacation_types_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  final LoginResponseModel userData;
  const HomeScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopAppBar(userData: userData,),
            SizedBox(height: 48.h,),
            BlocConsumer<HomeViewModel,HomeScreenState>(
                builder: (context,state){
                  if(state is HomeScreenLoadingState){
                    return const Center(child: LoadingWidget(),);
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyDashBoardWidget(vacationTypesList: context.read<HomeViewModel>().empVacationTypesList,),
                      VacationTypesWidget(vacationTypes:context.read<HomeViewModel>().vacationTypesList,)

                    ],
                  );
                },
                listener: (context,state){

                }),
            SizedBox(height: 30.h,)
          ],
        ),
      ),
    );
  }
}
