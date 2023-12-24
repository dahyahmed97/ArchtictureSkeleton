class GetEmpVacationTypesResponseModel {
  String? code;
  String? messageType;
  String? errorMessageContent;
  List<VacationType>? vacationType;

  GetEmpVacationTypesResponseModel(
      {this.code,
        this.messageType,
        this.errorMessageContent,
        this.vacationType});

  GetEmpVacationTypesResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messageType = json['messageType'];
    errorMessageContent = json['errorMessageContent'];
    if (json['vacationType'] != null) {
      vacationType = <VacationType>[];
      json['vacationType'].forEach((v) {
        vacationType!.add(VacationType.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['messageType'] = messageType;
    data['errorMessageContent'] = errorMessageContent;
    if (vacationType != null) {
      data['vacationType'] = vacationType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VacationType {
  int? vacationCode;
  int? value;
  int? usedValue;
  String? description;
  String? descriptionAr;
  int? active;
  String? outerColor;
  String? rule;

  VacationType(
      {this.vacationCode,
        this.value,
        this.usedValue,
        this.description,
        this.descriptionAr,
        this.active,
        this.outerColor,
        this.rule});

  VacationType.fromJson(Map<String, dynamic> json) {
    vacationCode = json['vacationCode'];
    value = json['value'];
    usedValue = json['usedValue'];
    description = json['description'];
    descriptionAr = json['descriptionAr'];
    active = json['active'];
    outerColor = json['outerColor'];
    rule = json['rule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vacationCode'] = vacationCode;
    data['value'] = value;
    data['usedValue'] = usedValue;
    data['description'] = description;
    data['descriptionAr'] = descriptionAr;
    data['active'] = active;
    data['outerColor'] = outerColor;
    data['rule'] = rule;
    return data;
  }
}