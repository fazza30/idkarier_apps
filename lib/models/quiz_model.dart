part of 'models.dart';

// Handle for list of sub menu / sub category
class CategoryModel {
    String idCategory;
    String category;

    CategoryModel({
       required this.idCategory,
       required this.category
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) {
      return CategoryModel(
        idCategory: json['id_category'],
        category: json['category'],
      );
    }
}


// Handle for list of questions
String questionModelToJson(List<QuestionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class QuestionModel {
    String idQuestion;
    String idCategory;
    String question;

    QuestionModel({
      required this.idQuestion,
      required this.idCategory,
      required this.question
    });

    factory QuestionModel.fromJson(Map<String, dynamic> json) {
      return QuestionModel(
        idQuestion: json['id_question'],
        idCategory: json['id_category'],
        question: json['question']
      );
    }

    Map<String, dynamic> toJson() => {
      "id_question": idQuestion,
      "id_category": idCategory,
      'question': question
    };
}


// Handle for list of options
List<OptionModel> optionModelFromJson(String str) => List<OptionModel>.from(json.decode(str).map((x) => OptionModel.fromJson(x)));
String optionModelToJson(List<OptionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OptionModel {
    OptionModel({
        required this.idResult,
        required this.result,
    });

    String idResult;
    String result;

    factory OptionModel.fromJson(Map<String, dynamic> json) => OptionModel(
        idResult: json["id_result"],
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "id_result": idResult,
        "result": result,
    };
}


