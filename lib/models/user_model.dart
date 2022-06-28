part of 'models.dart';

// Handle login model
LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));
String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.username,
    required this.password,
  });

  String username, password;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

// Handle register model
RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));
String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.email,
    required this.username,
    required this.password,
    required this.loginType,
    required this.pertanyaanValidasi,
    required this.answerValidation,
    required this.profilePicture,
  });

  String firstname,
      lastname,
      phone,
      email,
      username,
      password,
      loginType,
      pertanyaanValidasi,
      answerValidation,
      profilePicture;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
        phone: json["phone"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        loginType: json["login_type"],
        pertanyaanValidasi: json["pertanyaan_validasi"],
        answerValidation: json["answer_validation"],
        profilePicture: json["profile_picture"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "email": email,
        "username": username,
        "password": password,
        "login_type": loginType,
        "pertanyaan_validasi": pertanyaanValidasi,
        "answer_validation": answerValidation,
        "profile_picture": profilePicture,
      };
}

// handle forgot password models
ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));
String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());

class ForgotPasswordModel {
    ForgotPasswordModel({
        required this.newPassword,
        required this.username,
        required this.pertanyaanValidasi,
        required this.answerValidation,
    });

    String newPassword;
    String username;
    String pertanyaanValidasi;
    String answerValidation;

    factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) => ForgotPasswordModel(
        newPassword: json["new_password"],
        username: json["username"],
        pertanyaanValidasi: json["pertanyaan_validasi"],
        answerValidation: json["answer_validation"],
    );

    Map<String, dynamic> toJson() => {
        "new_password": newPassword,
        "username": username,
        "pertanyaan_validasi": pertanyaanValidasi,
        "answer_validation": answerValidation,
    };
}


// handle profile models
ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));
String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        required this.firstname,
        required this.lastname,
        required this.phone,
        required this.email,
        required this.username,
        required this.password,
        required this.loginType,
        required this.pertanyaanValidasi,
        required this.answerValidation,
        required this.profilePicture,
    });

    String firstname,
      lastname,
      phone,
      email,
      username,
      password,
      loginType,
      pertanyaanValidasi,
      answerValidation,
      profilePicture;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
        phone: json["phone"],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        loginType: json["login_type"],
        pertanyaanValidasi: json["pertanyaan_validasi"],
        answerValidation: json["answer_validation"],
        profilePicture: json["profile_picture"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "email": email,
        "username": username,
        "password": password,
        "login_type": loginType,
        "pertanyaan_validasi": pertanyaanValidasi,
        "answer_validation": answerValidation,
        "profile_picture": profilePicture,
    };
}
