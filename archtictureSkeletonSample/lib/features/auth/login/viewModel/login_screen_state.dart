
import 'package:equatable/equatable.dart';

import '../models/login_response_model.dart';

abstract class LoginScreenState  extends Equatable{
 @override
  List<Object?> get props => [];
}

class LoginScreenInitialState extends LoginScreenState {}

class LoginScreenLoadingState extends LoginScreenState{
}

class LoginScreenErrorState extends LoginScreenState{
  final String error;

  LoginScreenErrorState(this.error);

}

class LoginSuccessState extends LoginScreenState {
  final LoginResponseModel userData;
  LoginSuccessState(this.userData);
}

class LoginScreenNotifyUiState extends LoginScreenState {
  LoginScreenNotifyUiState();

}