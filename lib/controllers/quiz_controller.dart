part of 'controllers.dart';

typedef OnQuizNext = void Function(Question question);
typedef OnQuizCompleted = void Function(
    Categories quiz, double totalTaken, Duration takenTime);
typedef OnQuizStop = void Function(Categories quiz);

// Handle for QuizController
class QuizController {
  // Initialization
  int questionIndex = 0;
  bool isRunning = false;
  bool takeNewQuestion = true;
  DateTime questionTaken = DateTime.now();
  DateTime questionStartTime = DateTime.now();

  Categories category;
  List<int> takenQuestion = [];
  Map<int, int> questionAnswer = {};

  OnQuizNext nextQn;
  OnQuizCompleted completedQn;
  OnQuizStop stopQn;

  QuizController(this.category, this.nextQn, this.completedQn, this.stopQn);

  // Start question for selected category
  void start() {
    questionIndex = 0;
    takenQuestion = [];
    questionAnswer = {};
    isRunning = true;
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

        if (question == null ||
            category.questions.length == questionAnswer.length) {
          double totalResponse = 0.0;
          questionAnswer.forEach((key, value) {
            if (value == true) {
              totalResponse++;
            }
          });
          var takenTime = questionStartTime.difference(DateTime.now());
          completedQn(category, totalResponse, takenTime);
        }
        await Future.delayed(Duration(milliseconds: 300));
      } while (question != null);
      return false;
    });
  }

  // Handle stop question
  void stop() {
    takeNewQuestion = false;
    isRunning = false;
    stopQn(category);
  }

  // Handle next question
  void next() {
    takeNewQuestion = true;
  }

  // Handle for update answers
  void updateAnswer(int questionIndex, int answer) {
    var question = category.questions[questionIndex];
    questionAnswer[questionIndex] = question.options[answer].idResult;
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
  String option;
  bool isSelected;
  OptionSelectedController(this.option, this.isSelected);
}

// Handle feedbacks controller
class FeedbackController {
  final TextEditingController feedbacks = TextEditingController();
  BuildContext? context;

  Future updateAnswer(body) async {
    try {
      final response = await http.post(
        Uri.parse(apiFeedbackPost),
        headers: {
          "Accept": "application/json",
        }
      );
      if (response.statusCode == 200) {
        print("Code status: "+ response.statusCode.toString());
        final data = json.decode(response.body);
        print(data);
      }
    } catch (e) {
      Exception(e.toString());
    }
  }

  // Handle post
  void handlePost(BuildContext context) async {
    FeedbackModel commRequest = FeedbackModel(
      idUser: 0,
      idQuestion: 0,
      idResult: 0,
      cekAnswer: 0,
      feedback: ''
    );
    commRequest.idUser = 1;
    commRequest.idQuestion = 1;
    commRequest.idResult = 1;
    commRequest.cekAnswer = 1;
    commRequest.feedback = feedbacks.text;
    updateAnswer(feedbackModelToJson(commRequest));

    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString('feedback');
    if (val != null) {
      // Show popups
      showDialog(
        context: context,
        builder: (alertDialogContext) {
          return AlertDialog(
            title: const Text('Isi Kuesioner'),
            content: const Text('Jawaban berhasil diinput!'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(alertDialogContext),
                child: const Text('OK')
              )
            ],
          );
        }
      );

      await Navigator.of(context).pushNamedAndRemoveUntil(
        '/homepage',
        (Route<dynamic> r) => false
      );
    }
  }
}

class ChartController {
  int? idCategory;

  void handleId(BuildContext context) async {
    SharedPreferences? pref = await SharedPreferences.getInstance();
    idCategory = pref.getInt('id_category');
    if (idCategory != null) {
      Navigator.of(context).pushNamed('/chart_category_details');
    }
  }
}