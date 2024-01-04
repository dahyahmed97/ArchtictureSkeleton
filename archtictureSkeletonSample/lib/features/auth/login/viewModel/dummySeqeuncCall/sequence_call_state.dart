

import 'package:equatable/equatable.dart';

import '../../../../../core/utils/enums.dart';

abstract class SequenceCallState  extends Equatable{
 @override
  List<Object?> get props => [];
}

class SequenceCallInitialState extends SequenceCallState {}

class SequenceCallLoadingState extends SequenceCallState{
}

class SequenceCallErrorState extends SequenceCallState{
  final String error;
  final SequenceCalls sequenceCalls;


  SequenceCallErrorState(this.error, this.sequenceCalls);

}

class SequenceCallSuccessState extends SequenceCallState {
  SequenceCallSuccessState();

}