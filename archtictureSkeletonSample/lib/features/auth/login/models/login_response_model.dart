class LoginResponseModel {
  String? code;
  String? messageType;
  String? errorMessageContent;
  String? jwtToken;
  String? type;
  int? id;
  String? username;
  String? email;
  List<String>? roles;

  LoginResponseModel(
      {this.code,
        this.messageType,
        this.errorMessageContent,
        this.jwtToken,
        this.type,
        this.id,
        this.username,
        this.email,
        this.roles});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    messageType = json['messageType'];
    errorMessageContent = json['errorMessageContent'];
    jwtToken = json['jwtToken'];
    type = json['type'];
    id = json['id'];
    username = json['username'];
    email = json['email'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['messageType'] = messageType;
    data['errorMessageContent'] = errorMessageContent;
    data['jwtToken'] = jwtToken;
    data['type'] = type;
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['roles'] = roles;
    return data;
  }
}