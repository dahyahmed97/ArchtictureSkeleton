enum RequestType {
  post,
  get,
  put,
  delete,
}

enum ApiResult{
  success,
  failure
}

extension EnumApiResult on ApiResult {
  String? get type {
    switch (this) {
      case ApiResult.success:
        return "001";
      case ApiResult.failure:
        return "002";

    }   return null;
  }
}