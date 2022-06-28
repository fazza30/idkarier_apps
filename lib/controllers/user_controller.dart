part of 'controllers.dart';

// Handle login controller
class LoginController {
  // Initialization
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  BuildContext? context;

  // Code playground
  Future login(body) async {
    try {
      final response = await http.post(Uri.parse(apiLogin),
          headers: {"Accept": "application/json"}, body: body);
      if (response.statusCode == 200) {
        print("Code status: " + response.statusCode.toString());
        final data = json.decode(response.body);
        print(data);
        // Get user data for user homepage
        getUserData(data['username']);
        return data;
      } else {
        print("Code status: " + response.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("Error catchnya $e");
      await showDialog(
        context: context!,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: const Text("Gagal Login"),
            content: const Text("Akun tidak terdaftar! Silahkan lakukan register"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: const Text("OK")
              )
            ],
          );
        }
      );
      return null;
    }
  }

  // Collect data and store it to local device storage
  void getUserData(String user) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("username", user);
  }

  // Transfer data to homepage screen
  void redirectLogin(BuildContext context) async {
    LoginModel request = LoginModel(username: '', password: '');
    request.username = username.text;
    request.password = password.text;
    login(loginModelToJson(request));

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString('username');
     if(val != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/homepage',
        (Route<dynamic> r) => false
      );
     }
  }

  // Check if account has logged in before
  void checkLogin(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString('username');
    if (val != null) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        '/homepage',
        (Route<dynamic> r) => false
      );
    }
  }
}

// Handle register controller
class RegisterController {
  // Initialization
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController loginType = TextEditingController();
  final TextEditingController qn = TextEditingController();
  final TextEditingController answer = TextEditingController();

  // Code playground
  Future register(body) async {
    try {
      final response = await http.post(Uri.parse(apiRegister),
          headers: {"Accept": "application/json"}, body: body);
      if (response.statusCode == 200) {
        print("Code status: " + response.statusCode.toString());
        final data = json.decode(response.body);
        print(data);
        return data;
      } else {
        print("Code status: " + response.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("Error catchnya $e");
      return null;
    }
  }

  // Transfer data to database
  void redirectRegister(BuildContext context) async {
    RegisterModel request = RegisterModel(
      username: '', 
      password: '',
      firstname: '',
      lastname: '',
      email: '',
      phone: '',
      loginType: '',
      pertanyaanValidasi: '',
      answerValidation: '',
      profilePicture: ''
    );
    request.username = username.text;
    request.password = password.text;
    request.firstname = firstname.text;
    request.lastname = lastname.text;
    request.email = email.text;
    request.phone = phone.text;
    request.loginType = loginType.text;
    request.pertanyaanValidasi = qn.text;
    request.answerValidation = answer.text;
    request.profilePicture = "untitled.png";
    register(registerModelToJson(request));
   
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString('username');
     if(val != null) {
      // Showing popup when register successfull
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: const Text("Pendaftaran Akun"),
            content: const Text("Akun berhasil dibuat!"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: const Text("OK")
              )
            ],
          );
        }
      );

      // Redirect to login screen
      await Navigator.of(context).pushNamedAndRemoveUntil(
        '/login',
        (Route<dynamic> r) => false
      );
     }
  }
}

// Handle forgot password controller
class ForgotPasswordController {
  // Initialization
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController qn = TextEditingController();
  final TextEditingController answer = TextEditingController();

  BuildContext? context;

  // Code playground
  Future forgotPassword(body) async {
    try {
      final response = await http.post(Uri.parse(apiForgotPassword),
          headers: {"Accept": "application/json"}, body: body);
      if (response.statusCode == 200) {
        print("Code status: " + response.statusCode.toString());
        final data = json.decode(response.body);
        print(data);
        return data;
      } else {
        await showDialog(
          context: context!,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: const Text("Gagal Ubah Kata Sandi"),
              content: const Text("Username atau password salah!"),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: const Text("OK")
                )
              ],
            );
          }
        );
        print("Code status: " + response.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("Error catchnya $e");
      return null;
    }
  }

  // Transfer data to database
  void redirectLogin(BuildContext context) async {
    ForgotPasswordModel request = ForgotPasswordModel(
      username: '', 
      newPassword: '',
      pertanyaanValidasi: '',
      answerValidation: '');
    request.username = username.text;
    request.newPassword = password.text;
    request.pertanyaanValidasi = qn.text;
    request.answerValidation = answer.text;
    forgotPassword(forgotPasswordModelToJson(request));

    // Showing popup when password change successfull
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString('username');
     if(val != null) {
      await showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: const Text("Ganti Kata Sandi Berhasil"),
            content: const Text("Kata sandi berhasil diubah!"),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: const Text("OK")
              )
            ],
          );
        }
      );

      // Redirect to login screen
      await Navigator.of(context).pushNamedAndRemoveUntil(
        '/login',
        (r) => false
      );
     }
  }
}

// Handle profile controller
class ProfileController { 
  // Initialization
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController loginType = TextEditingController();
  final TextEditingController qn = TextEditingController();
  final TextEditingController answer = TextEditingController();
  BuildContext? context;

  // Code playground for get data
  Future getProfile() async {
    try {
      final response = await http.get(
        Uri.parse(apiGetProfile + '$username'),
        headers: {
          "Accept": "application/json"
        }
      );
      if (response.statusCode == 200) {
        print("Code status: " + response.statusCode.toString());
        // Map<String> data = jsonDecode(response.body) as Map<String, dynamic>;
        final data = profileModelFromJson(response.body);
        print(data);
        return data;
      } else {
        print("Code status: " + response.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("error catchnya $e");
      return null;
    }
  }

  // Code playground for update data
  Future updateProfile(body) async {
    try {
      final response = await http.post(
        Uri.parse(apiGetProfile + '$username'),
        headers: {
          "Accept": "application/json"
        }
      );
      if (response.statusCode == 200) {
        print("Code status: "+ response.statusCode.toString());
        final data = json.decode(response.body);
        print(data);
      } else {
        print("Code status: "+ response.statusCode.toString());
        return null;
      }
    } catch (e) {
      print("Error catchnya $e");
      return null;
    }
  }

  // Update data
  void updateData(BuildContext context) async {
    ProfileModel request = ProfileModel(
      username: '', 
      password: '',
      firstname: '',
      lastname: '',
      email: '',
      phone: '',
      loginType: '',
      pertanyaanValidasi: '',
      answerValidation: '',
      profilePicture: ''
    );
    request.username = username.text;
    request.password = password.text;
    request.firstname = firstname.text;
    request.lastname = lastname.text;
    request.email = email.text;
    request.phone = phone.text;
    request.loginType = loginType.text;
    request.pertanyaanValidasi = qn.text;
    request.answerValidation = answer.text;
    request.profilePicture = "untitled.png";
    updateProfile(profileModelToJson(request));

    // Show popup diaolog
    await showDialog(
      context: context,
      builder: (alertDialogContext) {
        return AlertDialog(
          title: const Text("Ubah Akun"),
          content: const Text("Akun berhasil diubah!"),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text("OK")
            )
          ],
        );
      }
    );

    // Redirect to login screen
    await Navigator.of(context).pushNamedAndRemoveUntil(
      '/profile',
      (r) => false
    );
  }
}