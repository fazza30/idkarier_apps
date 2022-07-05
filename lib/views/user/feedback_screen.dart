part of '../views.dart';

class FeedbackScreen extends StatefulWidget {
  static const routeName = '/feedback';
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  FeedbackController feedbackController = FeedbackController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(gradient: primaryGradient),
        child: Scaffold(
          backgroundColor: transparent,
          body: Column(
            children: <Widget>[
              Container(
                height: 50,
                color: transparent,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(
                          '/homepage'
                        );
                      },
                      child: const Icon(
                        Icons.clear_outlined,
                        color: whiteIconColor,
                        size: 24,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: const LinearProgressIndicator(
                        color: greenColor,
                        value: 1,
                        minHeight: 10,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(color: transparent),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 20),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "IdeKu untuk Pusat Karier",
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 18
                                    ),
                                  ),
                                  const Divider(
                                    height: 30,
                                    thickness: 1,
                                  ),
                                  TextFormField(
                                    controller: feedbackController.feedbacks,
                                    decoration: const InputDecoration(
                                      hintText: 'Tulis idemu disini untuk Pusat Karier yang lebih baik',
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black, width: 1)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.black, width: 1))
                                    ),
                                    style: Theme.of(context).textTheme.bodyText1,
                                    keyboardType: TextInputType.name,
                                    maxLines: 6,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Kolom tidak boleh kosong!';
                                      }
                                      debugPrint(val);
                                      return null;
                                    }
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                          child: Buttons(
                            colors: quizButtonColor,
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (alertDialogContext) {
                                  return AlertDialog(
                                    title: const Text('Quiz telah selesai'),
                                    content: const Text('Berhasil submit !'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(alertDialogContext),
                                        child: const Text('Ok'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              await Navigator.of(context).pushNamedAndRemoveUntil(
                                '/homepage',
                                (Route<dynamic> route) => false
                              );
                            },
                            child: Center(
                              child: Text(
                                'KIRIM',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                  color: textButtonColor
                                ),
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      )
    );
  }
}