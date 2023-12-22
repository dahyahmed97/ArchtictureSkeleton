import 'package:archtictureskeletonsample/core/preferences/preferences_manager.dart';
import 'package:archtictureskeletonsample/core/repo/repo.dart';
import 'package:archtictureskeletonsample/features/auth/login/models/login_request_model.dart';
import 'package:archtictureskeletonsample/features/auth/login/viewModel/login_screen_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


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
      emit(LoginSuccessState())
    });

    }
  }