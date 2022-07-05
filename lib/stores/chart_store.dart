part of 'stores.dart';

class ChartStore {
  // Initialize
  static SharedPreferences? prefs;

  // Import JSON data
  final String administrasi = 'assets/data/administrasi.json';
  final String event = 'assets/data/event.json';
  final String mediaPartner = 'assets/data/media_partner.json';
  final String mediaSosial = 'assets/data/media_sosial.json';
  final String organization = 'assets/data/organizational_belonging.json';
  final String pengelola = 'assets/data/pengelola.json';
  final String pengembangan = 'assets/data/pengembangan_diri.json';
  final String servis = 'assets/data/servis_data.json';

  // Load Category
  Future<List<Question>> loadCategories() async {
    List<Question> questionList = [];
    questionList = await JsonUtil.loadFromJsonAsync<Question> (
      administrasi, Question.jsonToObject
    );
    return questionList;
  }
}