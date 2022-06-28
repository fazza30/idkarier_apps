part of 'stores.dart';

class QuizStore {
  // Initialize
  static SharedPreferences? prefs;
  static const String historyListKey = "";
  LoginController loginController = LoginController();
  BuildContext? context;

  // Initialize SharedPreferences
  Future<void> initPrefs() async {
    loginController.redirectLogin(context!);
    prefs = await SharedPreferences.getInstance();
    String? val = prefs?.getString('username');
  }

  // Load Category
  Future<List<Categories>> loadCategoriesAsync() async {
    final response = await http.get(
      Uri.parse(apiGetAllCategory)
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      List<Categories> jsonResponse = map['message'];
      print(response.body);
      return jsonResponse.map((data) => Categories.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load category');
    }
  }
}