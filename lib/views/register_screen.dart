part of 'views.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  const RegisterScreen({ Key? key }) : super(key: key);
  
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final RegisterController registerController = RegisterController();
  List<String> loginTypeList = [
    'Mahasiswa',
    'Alumni'
  ];
  List<String> qnList = [
    'Apa hewan peliharaanmu?',
    'Apa warna favoritmu?'
  ];
  
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1.3,
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      // Header
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 60, 30, 20),
                        child: Text(
                          "DAFTAR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30
                          ),
                        ),
                      ),
                      // Firstname & lastname fields
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                child: InputTextFields(
                                  textInputController: registerController.firstname,
                                  title: "Nama Depan",
                                  hint: "Mis: John",
                                  keyboardType: TextInputType.name
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                child: InputTextFields(
                                  textInputController: registerController.lastname,
                                  title: "Nama Belakang",
                                  hint: "Mis. Doe",
                                  keyboardType: TextInputType.name
                                ),
                              )
                            )
                          ],
                        ),
                      ),
                      // Email field
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: InputTextFields(
                          textInputController: registerController.email,
                          title: "Email",
                          hint: "Masukkan email Anda",
                          keyboardType: TextInputType.emailAddress
                        )
                      ),
                      // Phone number field
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: InputTextFields(
                          textInputController: registerController.phone,
                          title: "No. Telepon",
                          hint: "Masukkan nomor telepon Anda",
                          keyboardType: TextInputType.number
                        )
                      ),
                      // Status field
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: SearchField(
                          textSearchController: registerController.loginType,
                          title: "Status",
                          hint: "Mahasiswa / Alumni",
                          itemList: loginTypeList
                        ),
                      ),
                      // Qn field
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: SearchField(
                          textSearchController: registerController.qn,
                          title: "Pertanyaan Keamanan",
                          hint: "Ketik 'apa' dan pilih salah satu",
                          itemList: qnList
                        ),
                      ),
                      // Answer field
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: InputTextFields(
                          textInputController: registerController.answer,
                          title: "Jawaban Keamanan",
                          hint: "Masukkan jawaban Anda",
                          keyboardType: TextInputType.text
                        ),
                      ),
                      // Username field
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: InputTextFields(
                          textInputController: registerController.username,
                          title: "Username",
                          hint: "Masukkan username Anda",
                          keyboardType: TextInputType.text
                        ),
                      ),
                      // Password field
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: InputPasswordFields(
                          textPasswordController: registerController.password,
                          title: "Kata Sandi",
                          hint: "Masukkan kata sandi Anda",
                        ),
                      ),
                      // Register button
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                        child: registerActionButton()
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }

  registerActionButton() {
    return Column(
      children: <Widget>[
        // Used for check user already have an account or nope
        AccountChecker(
          login: false,
          press: () {
            Navigator.of(context).pushNamed('/login');
          },
        ),
        // Login Button
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Buttons(
            onPressed: () {
              registerController.redirectRegister(context);
            },
            child: const Center(
              child: Text(
                "DAFTAR",
                style: TextStyle(
                  color: textButtonColor,
                  fontSize: 16
                ),
              )
            )
          ),
        )
      ],
    );
  }
}