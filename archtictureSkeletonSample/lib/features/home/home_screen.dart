import 'package:archtictureskeletonsample/core/commonWidgets/loading_widget.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_response_model.dart';
import 'package:archtictureskeletonsample/features/home/viewModel/home_screen_state.dart';
import 'package:archtictureskeletonsample/features/home/viewModel/home_view_model.dart';
import 'package:archtictureskeletonsample/features/home/widgets/TopAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final LoginResponseModel userData;
  const HomeScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TopAppBar(userData: userData,),
          BlocConsumer<HomeViewModel,HomeScreenState>(
              builder: (context,state){
                if(state is HomeScreenLoadingState){
                  return const Center(child: LoadingWidget(),);
                }
                return Container();
              },
              listener: (context,state){

              })
        ],
      ),
    );
  }
}
