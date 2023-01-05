class ErrorResponse {
  ApiError? apiError;

  ErrorResponse({this.apiError});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      apiError:
          json['apierror'] != null ? ApiError.fromJson(json['apierror']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.apiError != null) {
      data['apierror'] = this.apiError?.toJson();
    }
    return data;
  }
}

class ApiError {
  String? description;
  String? message;
  String? status;
  // Object? subErrors;
  int? timestamp;

  ApiError(
      {this.description,
      this.message,
      this.status,
      // this.subErrors,
      this.timestamp});

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      description: json['description'],
      message: json['message'],
      status: json['status'],
      // subErrors:
      //     json['subErrors'] != null ? Object.fromJson(json['subErrors']) : null,
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['timestamp'] = this.timestamp;
    if (this.description != null) {
      data['description'] = this.description;
    }
    // if (this.subErrors != null) {
    //   data['subErrors'] = this.subErrors.toJson();
    // }
    return data;
  }
}
