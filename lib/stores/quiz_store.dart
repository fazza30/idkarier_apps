part of 'stores.dart';

class QuizStore {
  // Initialize
  static SharedPreferences? prefs;
  static const String historyListKey = "HistoryListKey";
  
  // Import JSON data
  final String quizJsonFileName = 'assets/data/quiz.json';

  // Initialize SharedPreferences
  static Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  // Load Category
  Future<List<Categories>> loadCategories() async {
    List<Categories> categoryList = [];
    categoryList = await JsonUtil.loadFromJsonAsync<Categories> (
      quizJsonFileName, Categories.jsonToObject
    );
    return categoryList;
  }

  // Load Quiz by Category
  Future<List<Categories>> loadQuizByCategory(int categoryId) async {
    List<Categories> categoryList = [];
    categoryList = await JsonUtil.loadFromJsonAsync<Categories> (
      quizJsonFileName, Categories.jsonToObject
    );
    var quizList = categoryList.where((x) => x.idCategory == categoryId).toList();
    return categoryList;
  }

  // Get category
  Future<Categories> getCategory(int idCategory) async {
    List<Categories> categoryList = [];
    categoryList = await JsonUtil.loadFromJsonAsync<Categories> (
      quizJsonFileName, Categories.jsonToObject
    );
    return categoryList.where((x) => x.idCategory == idCategory).first;
  }

  // Get Quiz by id
  Future<Categories> getQuizById(int idQuestion, int idCategory) async {
    var category = await loadQuizByCategory(idCategory);
    var question = category.where((x) => x.idCategory == idQuestion).first;
    return question;
  }

  // Save quiz
  Future<void> saveQuiz(History history) async {
    var saveQuiz = await loadQuizHistory();
    saveQuiz.add(history);
    var historyJson = jsonEncode(saveQuiz);
    prefs?.setString(historyListKey, historyJson);
  }

  // Load quiz history
  Future<List<History>> loadQuizHistory() async {
    List<History> historyList = [];
    var ifExists = QuizStore.prefs?.containsKey(historyListKey);
    if (ifExists != null) {
      var historyJson = QuizStore.prefs!.getString(historyListKey);
      if (historyJson != null) {
        historyList = await JsonUtil.loadFromJsonStringAsync<History>(
          historyJson, History.jsonToObject
        );
        historyList = historyList.reversed.toList();
      }
    }
    return historyList;
  }
}

class JsonUtil {
  static Future<List<T>> loadFromJsonAsync<T>(
    String jsonAssetPath, Function jsonToObject) async {
    String data = await rootBundle.loadString(jsonAssetPath);
    var jsonResult = json.decode(data);
    List<T> items =
        List<T>.from(jsonResult.map((model) => jsonToObject(model)));
    return items;
  }

  static Future<List<T>> loadFromJsonStringAsync<T>(
      String jsonString, Function jsonToObject) async {
    var jsonResult = json.decode(jsonString);
    List<T> items =
        List<T>.from(jsonResult.map((model) => jsonToObject(model)));
    return items;
  }
}