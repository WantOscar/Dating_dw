class ErrorResponse {
  final String errorMessage;

  ErrorResponse({required this.errorMessage});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(errorMessage: json["errorMessage"]);
  }
}
