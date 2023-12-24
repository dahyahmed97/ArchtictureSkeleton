class GetEmpVacationTypesRequestModel {
  int? empId;

  GetEmpVacationTypesRequestModel({this.empId});

  GetEmpVacationTypesRequestModel.fromJson(Map<String, dynamic> json) {
    empId = json['empId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empId'] = empId;
    return data;
  }
}