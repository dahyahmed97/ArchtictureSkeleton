import 'package:archtictureskeletonsample/core/preferences/preferences_manager.dart';
import 'package:archtictureskeletonsample/core/repo/repo.dart';
import 'package:archtictureskeletonsample/core/utils/enums.dart';
import 'package:archtictureskeletonsample/features/home/models/getEmpAllVacations/get_emp_all_vacation_request_model.dart';
import 'package:archtictureskeletonsample/features/home/models/getEmpVacationTypes/get_emp_vacation_types_request_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/getEmpAllVacations/get_emp_all_vacations_response_model.dart';
import '../models/getEmpVacationTypes/get_emp_vacation_types_response_model.dart';
import '../models/getVacationTypes/get_vacation_types_response_model.dart';
import 'home_screen_state.dart';


class HomeViewModel extends Cubit<HomeScreenState> {
  final  IRepository _repository;
  final  PreferenceManager _preferenceManager;
  List<VacationType>empVacationTypesList=[];
  List<VacationTypes>vacationTypesList=[];
  List<Payload> empAllVacationRequest=[];
  HomeViewModel(this._repository,this._preferenceManager) : super(HomeScreenInitialState());


  void onInit(int userId) async {

    await Future.wait([
      getEmpVacationTypes(userId),
      getVacationTypes(),
      getEmpAllVacations(userId)
    ]).then((value) => {
    emit(HomeScreenNotifyUiState())
    });


     //await getEmpAllVacations(userId);
     // await getVacationTypes();
     // await getEmpAllVacations(userId);
      //emit(HomeScreenNotifyUiState());

  }
  Future<void> getEmpVacationTypes(int userID) async{
    emit(HomeScreenLoadingState());
    var res =await  _repository.getEmpVacationTypes(GetEmpVacationTypesRequestModel(empId: userID));
    res.fold((failure) => {
      emit(HomeScreenErrorState(failure.message))
    }, (response) =>{
      if(response.code==ApiResult.success.type){
        if(response.vacationType!=null){
          empVacationTypesList.addAll(response.vacationType!)
        }else{
         // emit(HomeScreenErrorState(response.errorMessageContent!))
        }
      }
    });
  }

  Future<void> getVacationTypes() async{
    emit(HomeScreenLoadingState());
    var res =await  _repository.getVacationTypes();
    res.fold((failure) => {
      emit(HomeScreenErrorState(failure.message))
    }, (response) =>{
      if(response.code==ApiResult.success.type){
        if(response.vacationTypes!=null){
          vacationTypesList.addAll(response.vacationTypes!)
        }else{
      //    emit(HomeScreenErrorState(response.errorMessageContent!))
        }
      }
    });
  }

  Future<void> getEmpAllVacations(int userId) async {
    emit(HomeScreenLoadingState());
    var res =await  _repository.getEmpAllVacations(GetEmpAllVacationsRequestModel(
        empId: userId,
        pageSize: 4,
        pageNumber: 0,
        sortOrder: "ASC"
    ));
    res.fold((failure) => {
      emit(HomeScreenErrorState(failure.message))
    }, (response) =>{
      if(response.code==ApiResult.success.type){
        if(response.payload!=null){
          empAllVacationRequest.addAll(response.payload!)
        }else{
        //  emit(HomeScreenErrorState(response.errorMessageContent!))
        }
      }
    });
  }
}
