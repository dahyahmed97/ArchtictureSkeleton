import 'package:archtictureskeletonsample/core/preferences/preferences_manager.dart';
import 'package:archtictureskeletonsample/core/repo/repo.dart';
import 'package:archtictureskeletonsample/features/auth/login/viewModel/login_screen_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';


class LoginScreenViewModel extends Cubit<LoginScreenState> {
  final  IRepository _repository;
  final  PreferenceManager _preferenceManager;
  LoginScreenViewModel(this._repository,this._preferenceManager) : super(LoginScreenInitialState());


  void onInit() async {


    }
  }