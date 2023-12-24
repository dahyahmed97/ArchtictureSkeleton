import 'package:archtictureskeletonsample/core/commonWidgets/loading_widget.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_response_model.dart';
import 'package:archtictureskeletonsample/features/home/viewModel/home_screen_state.dart';
import 'package:archtictureskeletonsample/features/home/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final LoginResponseModel userData;
  const HomeScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<HomeViewModel,HomeScreenState>(
            builder: (context,state){
              if(state is HomeScreenLoadingState){
                return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(child: LoadingWidget(),));
              }
              return Container();
            },
            listener: (context,state){

            })
      ],
    );
  }
}
