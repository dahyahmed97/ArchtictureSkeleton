
import 'package:equatable/equatable.dart';

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
  LoginSuccessState();
}

class LoginScreenNotifyUiState extends LoginScreenState {
  LoginScreenNotifyUiState();

}