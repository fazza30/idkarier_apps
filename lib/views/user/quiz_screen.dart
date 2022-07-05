part of '../views.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz';
  late Categories category;
  QuizScreen(this.category, {Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState(category);
}

class _QuizScreenState extends State<QuizScreen> with WidgetsBindingObserver {
  PageController pageController = PageController(initialPage: 0);
  double maxPages = 4;
  late double currentValue;
  
  late QuizController quizController;
  late QuizStore quizStore;
  late Categories categories;
  Question? qn;
  AppLifecycleState? state;
  int checkAnswer = 0;
  Timer? progress;
  Map<int, OptionSelectedController> _optionSerial = {};

  bool? isSelected;

  _QuizScreenState(this.categories) {
    quizStore = QuizStore();
    quizController = QuizController(
      categories,
      onNextQuestion,
      onQuizCompleted,
      onStop
    );
  }

  @override
  void initState() {
    quizController.start();
    // maxPages = categories.totalQn.toDouble();
    currentValue = 1 / maxPages;
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    if (mounted) {
      progress!.cancel();
    }
    quizController.stop();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    this.state = state;
  }

  void onNextQuestion(Question question) {
    setState(() {
      if (progress != null && progress!.isActive) {
        progress!.cancel();
      }

      this.qn = question;
      checkAnswer = question.cekAnswer;
      _optionSerial = {};

      for (var i = 0; i < question.options.length; i++) {
        _optionSerial[i] = OptionSelectedController(String.fromCharCode(65 + i), false);
      }

      Timer.periodic(Duration(seconds: 1), (timer) {
        try {
        if (mounted) {
          setState(() {
          progress = timer;
          });
        }
        } catch (e) {
          timer.cancel();
          print(e.toString());
        }
      });
    });
  }

  void onQuizCompleted(Categories categories, double total, Duration takenTime) {
    progress!.cancel();
    quizStore.getCategory(categories.idCategory).then((quiz) {
      quizStore
        .saveQuiz(History(
          quiz.idCategory,
          quiz.category,
          "$total/${quiz.questions.length}",
          takenTime.format(),
          "Completed"
        ))
        .then((x) {
          if (mounted) {
            dispose();
            Navigator.of(context).pushReplacementNamed(
              '/feedback'
            );
          }
        })
        ;
    });
  }

  void onStop(Categories categories) {
    progress!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(gradient: primaryGradient),
        child: Scaffold(
          backgroundColor: transparent,
          body: Column(children: [
            Container(
              height: 50,
              color: transparent,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.clear_outlined,
                      color: whiteIconColor,
                      size: 24,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: LinearProgressIndicator(
                      color: greenColor,
                      value: currentValue,
                      minHeight: 10,
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  print(index);
                  setState(() {
                    currentValue = (index + 1) / maxPages;
                  });
                },
                children: [
                  Container(
                    decoration: const BoxDecoration(color: transparent),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 30, 20, 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                // Question
                                Text(
                                  qn?.question ?? "",
                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontSize: 18
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const Divider(
                                  height: 30,
                                  thickness: 1,
                                ),
                                // Answer
                                options()
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 20, 30, 0),
                          child: Buttons(
                            colors: quizButtonColor,
                            onPressed: () {
                              pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                              );
                              quizController.next();
                            },
                            child: Center(
                              child: Text(
                                "KIRIM",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: textButtonColor,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  options() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List<Option>.from(qn?.options ?? []).map((x) {
        int optIndex = qn!.options.indexOf(x);
        var optState = GestureDetector(
          onTap: () {
            setState(() {
              quizController.updateAnswer(
                categories.questions.indexOf(qn!),
                optIndex
              );
              for (int i = 0; i < _optionSerial.length; i++) {
                _optionSerial[i]!.isSelected = false;
              }
              _optionSerial.update(
                optIndex,
                (val) {
                  val.isSelected = true;
                  return val;
                }
              );
            });
          },
          child: QnOpt(
            optIndex,
            x.imagePath,
            _optionSerial[optIndex]!.option,
            isSelected: _optionSerial[optIndex]!.isSelected,
          ),
        );
        return optState;
      }).toList(),
    );
  }
}
