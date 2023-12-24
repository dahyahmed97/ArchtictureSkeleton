import 'package:archtictureskeletonsample/core/preferences/preferences_manager.dart';
import 'package:archtictureskeletonsample/core/repo/repo.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_request_model.dart';
import 'package:archtictureskeletonsample/features/auth/login/viewModel/login_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';


class LoginScreenViewModel extends Cubit<LoginScreenState> {
  final  IRepository _repository;
  final  PreferenceManager _preferenceManager;
  LoginScreenViewModel(this._repository,this._preferenceManager) : super(LoginScreenInitialState());


  void performLogin(String username,String password) async {
    emit(LoginScreenLoadingState());
    var res = await _repository.performLogin(LoginRequestModel(username: username,password: password));
    res.fold((fail) =>{
      emit(LoginScreenErrorState(fail.message))
    }, (response) =>{
      if(response.code! == ApiResult.success.type){
        _preferenceManager.saveBearerToken(response.jwtToken!),
        emit(LoginSuccessState(response))
      }else{
        emit(LoginScreenErrorState(response.errorMessageContent!))
      }

    });

  }
  String? validateUsername(String username){
    if(username.trim().isNotEmpty){
      return null;
    }else{
      return "please enter valid username";
    }
  }
  String? validatePassword(String password){
    if(password.trim().isNotEmpty){
      return null;
    }else{
      return "please enter valid password";
    }
  }
}