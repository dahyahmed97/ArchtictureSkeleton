class GetVacationTypesResponseModel {
  String? code;
  String? messageType;
  String? errorMessageContent;
  List<VacationTypes>? vacationTypes;

  GetVacationTypesResponseModel(
      {this.code,
        this.messageType,
        this.errorMessageContent,
        this.vacationTypes});

  GetVacationTypesResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messageType = json['messageType'];
    errorMessageContent = json['errorMessageContent'];
    if (json['vacationTypes'] != null) {
      vacationTypes = <VacationTypes>[];
      json['vacationTypes'].forEach((v) {
        vacationTypes!.add(VacationTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['messageType'] = messageType;
    data['errorMessageContent'] = errorMessageContent;
    if (vacationTypes != null) {
      data['vacationTypes'] =
          vacationTypes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VacationTypes {
  int? id;
  String? description;
  String? descriptionAr;
  int? allowedPeriod;
  int? active;
  String? outerColor;
  String? rule;

  VacationTypes(
      {this.id,
        this.description,
        this.descriptionAr,
        this.allowedPeriod,
        this.active,
        this.outerColor,
        this.rule});

  VacationTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    descriptionAr = json['descriptionAr'];
    allowedPeriod = json['allowedPeriod'];
    active = json['active'];
    outerColor = json['outerColor'];
    rule = json['rule'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['descriptionAr'] = descriptionAr;
    data['allowedPeriod'] = allowedPeriod;
    data['active'] = active;
    data['outerColor'] = outerColor;
    data['rule'] = rule;
    return data;
  }
}


