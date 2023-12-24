class GetEmpAllVacationsRequestModel {
  int? empId;
  int? status;
  int? typeId;
  String? fromDateString;
  String? toDateString;
  int? pageNumber;
  int? pageSize;
  String? sortOrder;

  GetEmpAllVacationsRequestModel(
      {this.empId,
        this.status,
        this.typeId,
        this.fromDateString,
        this.toDateString,
        this.pageNumber,
        this.pageSize,
        this.sortOrder});

  GetEmpAllVacationsRequestModel.fromJson(Map<String, dynamic> json) {
    empId = json['empId'];
    status = json['status'];
    typeId = json['typeId'];
    fromDateString = json['fromDateString'];
    toDateString = json['toDateString'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    sortOrder = json['sortOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empId'] = empId;
    data['status'] = status;
    data['typeId'] = typeId;
    data['fromDateString'] = fromDateString;
    data['toDateString'] = toDateString;
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['sortOrder'] = sortOrder;
    return data;
  }
}