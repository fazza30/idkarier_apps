part of 'models.dart';

// Used for handle all quiz
/*
[
  {
    "id_category" : "1",
    "category" : "Pengelola",
    "imagePath": "assets/icons/category/pengelola.png",
    "questions" : {}
  }
]
*/
class Categories {
  late int idCategory;
  late String category;
  late String imagePath;
  late int totalQn;
  late List<Question> questions;

  Categories(
    this.idCategory,
    this.category,
    this.imagePath,
    this.totalQn,
    this.questions
  );

  Categories.fromJson(dynamic json) {
    idCategory = json['id_category'];
    category = json['category'];
    imagePath = json['image_path'];
    totalQn = json['total_qn'];
    questions = json['questions'];
  }

  static jsonToObject(dynamic json) {
    List<Question> questionList = [];
    if (json["questions"] != null) {
      questionList = List<Question>.from(json["questions"].map((x) => Question.fromJson(x)));
    }
    return Categories(
      json['id_category'],
      json['category'],
      json['image_path'],
      json['total_qn'],
      questionList
    );
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic> {};
    map['id_category'] = idCategory;
    map['category'] = category;
    map['image_path'] = imagePath;
    map['total_qn'] = totalQn;
    map['questions'] = List<dynamic>.from(questions.map((x) => x.toJson));
    return map;
  }
}

// Used for handle every question
/*
[
  {
    ...
    "questions" : {
      "id_question" : "<<number>>",
      "question" : "<<question>>",
      "cek_answer": 0,
      "options" : {}
    }
  }
]
*/
class Question {
  late int idQuestion;
  late String question;
  late int cekAnswer;
  late List<Option> options;

  Question(
    this.idQuestion,
    this.question,
    this.cekAnswer,
    this.options
  );

  Question.fromJson(dynamic json) {
    idQuestion = json['id_question'];
    question = json['question'];
    cekAnswer = json['cek_answer'];
    options = List<Option>.from(json["options"].map((x) => Option.fromJson(x)));
  }

  static jsonToObject(dynamic json) {
    List<Option> options = [];
    if (json['options'] != null) {
      options =
        List<Option>.from(json['options'].map((x) => Option.fromJson(x)));
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic> {};
    map['id_question'] = idQuestion;
    map['question'] = question;
    map['cek_answer'] = cekAnswer;
    map['options'] = List<dynamic>.from(options.map((x) => x.toJson()));
    return map;
  }
}

// Used for handle result every question
/*
[
  {
    ... : {
      ...
      "options" : {
        "id_answer" : "1",
        "answer" : "Sangat Tidak Setuju",
        "imagePath" : "assets/icons/options/strongly_disagree.png"
      }
    }
  }
]
*/
class Option {
  late int idResult;
  late String result;
  late String imagePath;

  Option(
    this.idResult,
    this.result,
    this.imagePath
  );

  Option.fromJson(dynamic json) {
    idResult = json['id_result'];
    result = json['result'];
    imagePath = json['image_path'];

  }

  static jsonToObject(dynamic json) {
    return Option(json['id_result'], json['result'], json['image_path']);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic> {};
    map['id_result'] = idResult;
    map['result'] = result;
    map['image_path'] = imagePath;
    return map;
  }
}

// Used for handle history of taken quiz
class History {
  int idCategory = 0;
  String category = '';
  String hasTaken = '';
  String timeTaken = '';
  String status = '';

  History(
    this.idCategory,
    this.category,
    this.hasTaken,
    this.timeTaken,
    this.status
  );

  History.fromJson(dynamic json) {
    idCategory = json['id_category'];
    category = json['category'];
    hasTaken = json['score'];
    timeTaken = json['time_taken'];
    status = json['status'];
  }

  static jsonToObject(dynamic json) {
    return History(
      json['id_category'],
      json['category'],
      json['score'],
      json['time_taken'],
      json['status']
    );
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic> {};
    map['id_category'] = idCategory;
    map['category'] = category;
    map['score'] = hasTaken;
    map['timeTaken'] = timeTaken;
    map['status'] = status;
    return map;
  }
}

// Handle feedback
/*
[
  {
    "id_user" : 1,
    "id_question" : 1,
    "id_result" : 4,
    "cek_answer" : 1,
    "feedback" : "Ditingkatkan lagi pelayanannya"
  }
]
*/
FeedbackModel feedbackModelFromJson(String str) => FeedbackModel.fromJson(json.decode(str));
String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
    FeedbackModel({
        required this.idUser,
        required this.idQuestion,
        required this.idResult,
        required this.cekAnswer,
        required this.feedback,
    });

    int idUser;
    int idQuestion;
    int idResult;
    int cekAnswer;
    String feedback;

    factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        idUser: json["id_user"],
        idQuestion: json["id_question"],
        idResult: json["id_result"],
        cekAnswer: json["cek_answer"],
        feedback: json["feedback"],
    );

    Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "id_question": idQuestion,
        "id_result": idResult,
        "cek_answer": cekAnswer,
        "feedback": feedback,
    };
}

class SurveyResponseModel {
  var veryBad = Random().nextInt(20) + 10; // Value is >= 1 and < 4.
  var bad = Random().nextInt(30) + 20; // Value is >= 4 and < 10.
  var good = Random().nextInt(50) + 30; // Value is >= 11 and < 30.
  var veryGood = Random().nextInt(50) + 30; // Value is >= 31 and < 60.
}