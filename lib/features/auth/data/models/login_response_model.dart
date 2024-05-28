class LoginResponseModel {
  LoginResponseModel({this.accessToken, this.refreshToken});

  factory LoginResponseModel.fromJson(Map<dynamic, dynamic> json) =>
      LoginResponseModel(
        accessToken: json['access_token'],
        refreshToken: json['refresh_token'],
      );
  dynamic accessToken;
  dynamic refreshToken;

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'refresh_token': refreshToken,
      };
}
