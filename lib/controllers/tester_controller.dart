part of 'controllers.dart';
  
typedef OnQuizNext = void Function(Question question);
typedef OnQuizCompleted = void Function(
  Categories quiz,
  double totalTaken,
  Duration takenTime
);
typedef OnQuizStop = void Function(Categories quiz);

// Handle for QuizController
class QuizController {
  // Initialization
  int questionIndex = 0;
  bool takeNewQuestion = true;
  DateTime questionTaken = DateTime.now();
  DateTime questionStartTime = DateTime.now();

  Categories category;
  List<int> takenQuestion = [];
  Map<int, bool> questionAnswer = {};

  OnQuizNext nextQn;
  OnQuizCompleted completed;
  OnQuizStop stop;

  QuizController(
    this.category,
    this.nextQn,
    this.completed,
    this.stop
  );

  // Start question for selected category
  void start() {
    questionIndex = 0;
    takenQuestion = [];
    questionAnswer = {};
    takeNewQuestion = true;

    Future.doWhile(() async {
      Question? question;
      questionStartTime = DateTime.now();
      questionTaken = DateTime.now();

      do {
        // Handle if user start new question
        if (takeNewQuestion) {
          question = _onNextQuestion(category, questionIndex);
          if (question != null) {
            takeNewQuestion = false;
            questionIndex++;
            questionStartTime = DateTime.now();
            nextQn(question);
            print(question);
          }
        }

        if (question == null || category.questions.length == questionAnswer.length) {
          double totalResponse = 0.0;
          questionAnswer.forEach((key, value) {
            if (value == true) {
              totalResponse++;
            }
          });
          var takenTime = questionStartTime.difference(DateTime.now());
          completed(category, totalResponse, takenTime);
        }
        await Future.delayed(Duration(milliseconds: 300));
      } while (question != null);

      return false;
    });
  }

  // Handle stop question
  void _stop() {
    takeNewQuestion = false;
    stop(category);
  }

  // Handle next question 
  void _next() {
    takeNewQuestion = true;
  }

  // Handle for update answers
  void _updateAnswer(int questionIndex, int answer) {
    var question = category.questions[questionIndex];
    // questionAnswer[questionIndex] = question.options[answer];
  }

  // Logic if user click 'KIRIM' button
  Question? _onNextQuestion(Categories category, int index) {
    while (true) {
      if (takenQuestion.length >= category.questions.length) {
        return null;
      } else {
        return category.questions[index];
      }
    }
  }
}

// Handle quiz result
class QuizResult {
  Categories category;
  double totalFilled;
  QuizResult(this.category, this.totalFilled);
}

// Handle selected option
class OptionSelectedController {
  bool isSelected;
  String option;
  OptionSelectedController(this.isSelected, this.option);
}