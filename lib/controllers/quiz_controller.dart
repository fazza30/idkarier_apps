part of 'controllers.dart';

class CategoryController {
  Future<List<CategoryModel>> showAllCategory() async {
    final response = await http.get(
      Uri.parse(apiGetAllCategory)
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      List<dynamic> jsonResponse = map['data'];
      print(response.body);
      return jsonResponse.map((data) => CategoryModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load category');
    }
  }

  // Transfer data to Quiz Screen
  void redirectQuizScreen(BuildContext context) async {
    CategoryModel request = CategoryModel(
      idCategory: '',
      category: ''
    );
    SharedPreferences pref = await SharedPreferences.getInstance();
    
    String? val = pref.getString('category');
    if(val != null) {
      await Navigator.of(context).pushNamed('/quiz');
    }
  }
}

class QuestionController {
  Future<List<QuestionModel>> showAllQuestion(String username, String category) async {
      final response = await http.get(
        Uri.parse(
          apiGetQn + 
          "username=$username" + 
          "&category=$category"
        ),
          headers: {"Accept": "application/json"}
      );
      if (response.statusCode == 200) {
        print("Code status: " + response.statusCode.toString());
        List jsonResponse = jsonDecode(response.body);
        return jsonResponse.map((data) => QuestionModel.fromJson(data)).toList();
      } else {
        throw Exception('Failed to load question');
      }
  }
}

class OptionController {
  Future showAllOption() async {
    try {
      final response = await http.get(Uri.parse(apiGetQn),
          headers: {"Accept": "application/json"});
      if (response.statusCode == 200) {
        print("Code status: " + response.statusCode.toString());
        final data = optionModelFromJson(response.body);
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
}