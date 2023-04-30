/*
class ApiResponse {
  String code;
  Response response;
  String errorMessage;

  ApiResponse(
      {required this.code, required this.response, required this.errorMessage});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      code: json['code'],
      response: Response.fromJson(json['response']),
      errorMessage: json['errorMessage'],
    );
  }
}

class Response {
  String authToken;
  String refreshToken;

  Response({required this.authToken, required this.refreshToken});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      authToken: json['authToken'],
      refreshToken: json['refreshToken'],
    );
  }
}
*/
class LoginResponse {
  final bool success;
  final String message;
  final String token;

  LoginResponse(
      {required this.success, required this.message, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      token: json['token'] as String? ?? '',
    );
  }
}

class LoginRequest {
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
