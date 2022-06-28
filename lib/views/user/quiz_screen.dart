part of '../views.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quiz';
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  PageController pageController = PageController(initialPage: 0);
  final double maxPages = 5;
  late double currentValue = 1 / maxPages;
  // late String username;
  // late String category;
  
  QuestionController questionController = QuestionController();
  late Future<List<QuestionModel>> listData;

  bool? isSelected;

  @override
  void initState() {
    currentValue = 1 / maxPages;
    // listData = questionController.showAllQuestion(username, category);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: primaryGradient
        ),
        child: Scaffold(
          backgroundColor: transparent,
          body: Column(
            children: [
              Container(
                height: 50,
                color: transparent,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
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
                      decoration: BoxDecoration(
                        color: transparent
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.85,
                            height: MediaQuery.of(context).size.height * 0.7,
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  // Question
                                  question(),
                                  // Text(
                                  //   "Pertanyaan akan muncul disini",
                                  //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  //     fontSize: 18
                                  //   ),
                                  //   textAlign: TextAlign.center,
                                  // ),
                                  const Divider(
                                    height: 30,
                                    thickness: 1,
                                  ),
                                  // Answer
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){print("Selected 1");},
                                            child: Image.asset("assets/icons/options/strongly_disagree.png", width: 50),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){
                                              print("Selected 2");
                                            },
                                            child: Image.asset("assets/icons/options/disagree.png", width: 50),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){print("Selected 3");},
                                            child: Image.asset("assets/icons/options/agree.png", width: 50),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: (){print("Selected 4");},
                                            child: Image.asset("assets/icons/options/strongly_agree.png", width: 50),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                            child: Buttons(
                              colors: quizButtonColor,
                              onPressed: () {
                                pageController.nextPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease
                                );
                              },
                              child: Center(
                                child: Text(
                                  "LANJUT",
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: textButtonColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    
                    Container(
                      child: Center(child: Text("Halaman 2")),
                    ),
                    Container(
                      child: Center(child: Text("Halaman 3")),
                    ),
                    Container(
                      child: Center(child: Text("Halaman 4")),
                    ),
                    Container(
                      child: Center(child: Text("Halaman 5")),
                    ),
                  ],
                ),
              )
            ]
          ),
        ),
      ),
    );
  }

  question() {
    return FutureBuilder<List<QuestionModel>>(
      future: listData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<QuestionModel> isiData = snapshot.data!;
          return const Text(
            "Ololololo"
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      }
    );
  }
}