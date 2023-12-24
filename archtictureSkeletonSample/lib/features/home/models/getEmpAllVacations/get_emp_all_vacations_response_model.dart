class GetEmpAllVacationsResponseModel {
  String? code;
  String? messageType;
  String? errorMessageContent;
  List<Payload>? payload;
  int? count;

  GetEmpAllVacationsResponseModel(
      {this.code,
        this.messageType,
        this.errorMessageContent,
        this.payload,
        this.count});

  GetEmpAllVacationsResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messageType = json['messageType'];
    errorMessageContent = json['errorMessageContent'];
    if (json['payload'] != null) {
      payload = <Payload>[];
      json['payload'].forEach((v) {
        payload!.add(Payload.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['messageType'] = messageType;
    data['errorMessageContent'] = errorMessageContent;
    if (payload != null) {
      data['payload'] = payload!.map((v) => v.toJson()).toList();
    }
    data['count'] = count;
    return data;
  }
}

class Payload {
  int? instanceId;
  int? employeeId;
  String? employeeName;
  int? vacationTypeId;
  String? startDate;
  String? startDateString;
  String? endDate;
  String? endDateString;
  int? period;
  int? decisionNumber;
  String? decisionDate;
  String? decisionDateString;
  int? approvedEmployeeId;
  String? notes;
  int? attachmentId;
  String? requestDate;
  String? requestDateString;
  int? status;
  String? type;
  List<Attachments>? attachments;

  Payload(
      {this.instanceId,
        this.employeeId,
        this.employeeName,
        this.vacationTypeId,
        this.startDate,
        this.startDateString,
        this.endDate,
        this.endDateString,
        this.period,
        this.decisionNumber,
        this.decisionDate,
        this.decisionDateString,
        this.approvedEmployeeId,
        this.notes,
        this.attachmentId,
        this.requestDate,
        this.requestDateString,
        this.status,
        this.type,
        this.attachments});

  Payload.fromJson(Map<String, dynamic> json) {
    instanceId = json['instanceId'];
    employeeId = json['employeeId'];
    employeeName = json['employeeName'];
    vacationTypeId = json['vacationTypeId'];
    startDate = json['startDate'];
    startDateString = json['startDateString'];
    endDate = json['endDate'];
    endDateString = json['endDateString'];
    period = json['period'];
    decisionNumber = json['decisionNumber'];
    decisionDate = json['decisionDate'];
    decisionDateString = json['decisionDateString'];
    approvedEmployeeId = json['approvedEmployeeId'];
    notes = json['notes'];
    attachmentId = json['attachmentId'];
    requestDate = json['requestDate'];
    requestDateString = json['requestDateString'];
    status = json['status'];
    type = json['type'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments!.add(Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['instanceId'] = instanceId;
    data['employeeId'] = employeeId;
    data['employeeName'] = employeeName;
    data['vacationTypeId'] = vacationTypeId;
    data['startDate'] = startDate;
    data['startDateString'] = startDateString;
    data['endDate'] = endDate;
    data['endDateString'] = endDateString;
    data['period'] = period;
    data['decisionNumber'] = decisionNumber;
    data['decisionDate'] = decisionDate;
    data['decisionDateString'] = decisionDateString;
    data['approvedEmployeeId'] = approvedEmployeeId;
    data['notes'] = notes;
    data['attachmentId'] = attachmentId;
    data['requestDate'] = requestDate;
    data['requestDateString'] = requestDateString;
    data['status'] = status;
    data['type'] = type;
    if (attachments != null) {
      data['attachments'] = attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attachments {
  int? id;
  int? entityId;
  String? attachmentId;
  String? fileName;

  Attachments({this.id, this.entityId, this.attachmentId, this.fileName});

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entityId = json['entityId'];
    attachmentId = json['attachmentId'];
    fileName = json['fileName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['entityId'] = entityId;
    data['attachmentId'] = attachmentId;
    data['fileName'] = fileName;
    return data;
  }
}