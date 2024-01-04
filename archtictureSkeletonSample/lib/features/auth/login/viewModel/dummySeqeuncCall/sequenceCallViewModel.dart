import 'package:archtictureskeletonsample/core/preferences/preferences_manager.dart';
import 'package:archtictureskeletonsample/core/repo/repo.dart';
import 'package:archtictureskeletonsample/features/auth/login/viewModel/dummySeqeuncCall/sequence_call_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/enums.dart';


class SequenceCallViewModel extends Cubit<SequenceCallState> {
  final IRepository _repository;
  final  PreferenceManager _preferenceManager;
  SequenceCallViewModel(this._repository,this._preferenceManager) : super(SequenceCallInitialState());


  void onInit() async {


  }
  Future<void> call1() async {
    var res= await _repository.getVacationTypes();
    res.fold((fail) =>{
      emit(SequenceCallErrorState(fail.message,SequenceCalls.call1))
    }, (response) => {
      if(response.code==ApiResult.success.type){
        if(response.vacationTypes!=null){
          //  vacationTypesList.addAll(response.vacationTypes!)
          call2()
        }else{
          emit(SequenceCallErrorState(response.errorMessageContent!,SequenceCalls.call1))
        }
      }
    });
  }

  Future<void> call2() async {
    var res= await _repository.getVacationTypes();
    res.fold((fail) =>{
      emit(SequenceCallErrorState(fail.message,SequenceCalls.call2))
    }, (response) => {
      if(response.code==ApiResult.success.type){
        if(response.vacationTypes!=null){
          //  vacationTypesList.addAll(response.vacationTypes!)
          call3()
        }else{
          emit(SequenceCallErrorState(response.errorMessageContent!,SequenceCalls.call2))
        }
      }
    });
  }

  Future<void> call3() async {
    var res= await _repository.getVacationTypes();
    res.fold((fail) =>{
      emit(SequenceCallErrorState(fail.message,SequenceCalls.call3))
    }, (response) => {
      if(response.code==ApiResult.success.type){
        if(response.vacationTypes!=null){
          emit(SequenceCallSuccessState())
        }else{
          emit(SequenceCallErrorState(response.errorMessageContent!,SequenceCalls.call3))
        }
      }
    });
  }

  
}