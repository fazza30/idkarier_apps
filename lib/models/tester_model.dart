part of 'models.dart';

// Used for handle all quiz
/*
[
  {
    "id_category" : "1",
    "category" : "Pengelola",
    "questions" : {}
  }
]
*/
class Categories {
  late String idCategory;
  late String category;
  late List<Question> questions;

  Categories(
    this.idCategory,
    this.category,
    this.questions
  );

  Categories.fromJson(dynamic json) {
    idCategory = json['id_category'];
    category = json['category'];
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
      questionList
    );
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic> {};
    map['id_category'] = idCategory;
    map['category'] = category;
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
      "options" : {}
    }
  }
]
*/
class Question {
  late String idQuestion;
  late String question;
  late List<Option> options;

  Question(
    this.idQuestion,
    this.question,
    this.options
  );

  Question.fromJson(dynamic json) {
    idQuestion = json['id_question'];
    question = json['question'];
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
    map['options'] = List<dynamic>.from(options.map((x) => x.toJson()));
    return map;
  }
}

// Used for handle option every question
/*
[
  {
    ... : {
      ...
      "options" : {
        "id_option" : "1",
        "option" : ""
      }
    }
  }
]
*/
class Option {
  late String idOption;
  late String option;

  Option(
    this.idOption,
    this.option
  );

  Option.fromJson(dynamic json) {
    idOption = json['id_result'];
    option = json['result'];
  }

  static jsonToObject(dynamic json) {
    return Option(json['id_result'], json['result']);
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic> {};
    map['id_result'] = idOption;
    map['result'] = option;
    return map;
  }
}