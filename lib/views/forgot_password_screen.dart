part of 'views.dart';

class ForgotPassword extends StatefulWidget {
  static const routeName = '/forgot_password';
  const ForgotPassword({Key? key}) : super(key: key);
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  ForgotPasswordController forgotPasswordController = ForgotPasswordController();
  List<String> loginTypeList = [
    'Mahasiswa',
    'Alumni'
  ];
  List<String> qnList = [
    'Apa hewan peliharaanmu?',
    'Apa warna favoritmu?'
  ];

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: transparent
                ),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // Headers
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 60, 30, 60),
                        child: Text(
                          'LUPA KATA SANDI',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                          ),
                        ),
                      ),
                      // Password Input
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: InputPasswordFields(
                          textPasswordController: forgotPasswordController.password,
                          title: "Kata Sandi Baru",
                          hint: "Masukkan kata sandi baru Anda"
                        ),
                      ),
                      // Username Input
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: InputTextFields(
                          textInputController: forgotPasswordController.username,
                          title: "Username",
                          hint: "Masukkan username Anda",
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      // Questions field
                      Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                          child: SearchField(
                            textSearchController: forgotPasswordController.qn,
                            title: "Pertanyaan Keamanan",
                            hint: "Ketik 'apa' dan pilih salah satu",
                            itemList: qnList
                          ),
                        ),
                        // Answer field
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                          child: InputTextFields(
                            textInputController: forgotPasswordController.answer,
                            title: "Jawaban Keamanan",
                            hint: "Masukkan jawaban Anda",
                            keyboardType: TextInputType.text
                          ),
                        ),
                      // AccountChecker and Login Button
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                        child: forgotPasswordActionButton(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  forgotPasswordActionButton() {
    return Column(
      children: <Widget>[
        // Login Button
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Buttons(
            onPressed: () {
              forgotPasswordController.redirectLogin(context);
            },
            child: const Center(
              child: Text(
                "UBAH KATA SANDI",
                style: TextStyle(
                  color: textButtonColor,
                  fontSize: 16
                ),
              ),
            )
          ),
        )
      ],
    );
  }
}