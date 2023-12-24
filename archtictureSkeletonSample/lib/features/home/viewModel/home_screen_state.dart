

import 'package:equatable/equatable.dart';

abstract class HomeScreenState  extends Equatable{
 @override
  List<Object?> get props => [];
}

class HomeScreenInitialState extends HomeScreenState {}

class HomeScreenLoadingState extends HomeScreenState{
}
class HomeScreenErrorState extends HomeScreenState{
  final String error;

  HomeScreenErrorState(this.error);

}
class HomeScreenNotifyUiState extends HomeScreenState {
  HomeScreenNotifyUiState();

}