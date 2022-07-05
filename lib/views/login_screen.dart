part of 'views.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({ Key? key }) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = LoginController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: transparent
              ),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // Headers
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 60, 30, 60),
                      child: Text(
                        'MASUK',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                        ),
                      ),
                    ),
                    // Username Input
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                      child: InputTextFields(
                        textInputController: loginController.username,
                        title: "Username",
                        hint: "Masukkan username Anda",
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    // Password Input
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                      child: InputPasswordFields(
                        textPasswordController: loginController.password,
                        title: "Kata Sandi",
                        hint: "Masukkan kata sandi Anda"
                      ),
                    ),
                    // Forgot Password Direction
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/forgot_password',
                          );
                        },
                        child: const Text(
                          "Lupa kata sandi?",
                          style: TextStyle(
                            fontStyle: FontStyle.italic
                          ),
                        ),
                      ),
                    ),
                    // AccountChecker and Login Button
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                      child: loginActionButton(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  loginActionButton() {
    return Column(
      children: <Widget>[
        // Used for check user already have an account or nope
        AccountChecker(
          login: true,
          press: () {
            Navigator.of(context).pushNamed('/register');
          },
        ),
        // Login Button
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
          child: Buttons(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                loginController.redirectLogin(context);
              }
            },
            child: const Center(
              child: Text(
                "MASUK",
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