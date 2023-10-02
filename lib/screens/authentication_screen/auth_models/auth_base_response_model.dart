class AuthBaseResponseModel {
  AuthBaseResponseModel({
    this.data,
    this.error,
    this.message,
  });

  dynamic data;
  dynamic error;
  String? message;

  factory AuthBaseResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthBaseResponseModel(
      data: json["data"],
      error: json["error"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data,
    "error": error,
    "message": message,
  };
}
