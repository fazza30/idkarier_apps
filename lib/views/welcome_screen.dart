part of 'views.dart';

class WelcomeScreen extends StatefulWidget {
  static const routeName = '/';
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final LoginController loginController = LoginController();
  @override
  void initState() {
    super.initState();
    loginController.checkLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // App Logo
              SvgPicture.asset(
                'assets/images/logo.svg',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              // Header
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(15, 30, 15, 15),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset('assets/images/logo-perusahaan.png',
                            height: 40, fit: BoxFit.cover)
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                      child: Text(
                        'Pasarnya ide, salurkan idemu agar membuat perubahan baru',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Buttons(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/login',
                        (r) => false
                      );
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/register',
                          (r) => false
                        );
                      },
                      child: const Text(
                        "DAFTAR",
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
