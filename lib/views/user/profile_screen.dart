part of '../views.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<String> loginTypeList = [
    'Mahasiswa',
    'Alumni'
  ];
  List<String> qnList = [
    '1. Apa hewan peliharaanmu?',
    '2. Apa warna favoritmu?'
  ];
  String? firstname,
    lastname,
    phone,
    email,
    username,
    password,
    loginType,
    pertanyaanValidasi,
    answerValidation,
    profilePicture;
  ProfileController profileController = ProfileController();
  final formKey = GlobalKey<FormState>();

  void getCredentials() async {
    SharedPreferences? pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('username');
      getProfile();
    });
  }

  void getProfile() async {
    var response = await http.get(
      Uri.parse(apiGetProfile + '$username'),
      headers: {
        "Accept": "application/json"
      }
    );
    if (response.statusCode == 200) {
      print("Code status: " + response.statusCode.toString());
      // print(response.body);
      var data = jsonDecode(response.body);
      setState(() {
        firstname = data['firstname'].toString();
        lastname = data['lastname'].toString();
        phone = data['phone'].toString();
        email = data['email'].toString();
        password = data['password'].toString();
        loginType = data['login_type'].toString();
        pertanyaanValidasi = data['pertanyaan_validasi'].toString();
        answerValidation = data['answer_validation'].toString();
      });
    } else {
      print("Code status: " + response.statusCode.toString());
      return null;
    }
  }

  @override
  void initState() {
    getCredentials();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          leading: IconButton(
            color: transparent,
            splashRadius: 30,
            icon: const Icon(
              Icons.chevron_left_rounded,
              color: whiteIconColor,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "Profil",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: textButtonColor,
              fontSize: 18
            ),
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45),
                    bottomRight: Radius.circular(45),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0)
                  )
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                      child: SvgPicture.asset(
                        'assets/images/jumbotron_bg.svg',
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.03, 0.59),
                      child: Text(
                        '$email',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w100,
                            color: textButtonColor,
                            fontSize: 14),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.02, -0.69),
                      child: Container(
                        width: 70,
                        height: 70,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/images/logo-uin.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-0.03, 0.26),
                      child: Text(
                        '$firstname $lastname',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: textButtonColor, 
                          fontSize: 16
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Firstname & Lastname field
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                                  child: InputTextFields(
                                    textInputController: profileController.firstname,
                                    title: "Nama Depan",
                                    hint: "$firstname",
                                    keyboardType: TextInputType.name
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                  child: InputTextFields(
                                    textInputController: profileController.lastname,
                                    title: "Nama Belakang",
                                    hint: "$lastname",
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
                            textInputController: profileController.email,
                            title: "Email",
                            hint: "$email",
                            keyboardType: TextInputType.emailAddress
                          )
                        ),
                        // Phone number field
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                          child: InputTextFields(
                            textInputController: profileController.phone,
                            title: "No. Telepon",
                            hint: "$phone",
                            keyboardType: TextInputType.number
                          )
                        ),
                        // Status field
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                          child: SearchField(
                            isEnable: false,
                            textSearchController: profileController.loginType,
                            hint: "$loginType",
                            title: "Status",
                            itemList: loginTypeList
                          ),
                        ),
                        // Qn field
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                          child: SearchField(
                            isEnable: true,
                            textSearchController: profileController.qn,
                            hint: "$pertanyaanValidasi",
                            title: "Pertanyaan Keamanan",
                            itemList: qnList
                          ),
                        ),
                        // Answer field
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                          child: InputTextFields(
                            textInputController: profileController.answer,
                            title: "Jawaban Keamanan",
                            hint: "$answerValidation",
                            keyboardType: TextInputType.text
                          ),
                        ),
                        // Username field
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                          child: InputTextFields(
                            textInputController: profileController.username,
                            title: "Username",
                            hint: "$username",
                            keyboardType: TextInputType.text
                          ),
                        ),
                        // Password field
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                          child: InputPasswordFields(
                            textPasswordController: profileController.password,
                            title: "Kata Sandi",
                            hint: "$password",
                          ),
                        ),
                        // Edit button
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                          child: editActionButton()
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }

  // Edit button command
  editActionButton() {
    return Buttons(
      onPressed: () {
        profileController.updateData(context);
      },
      child: const Center(
        child: Text(
          "UBAH DATA",
          style: TextStyle(
            color: textButtonColor,
            fontSize: 16
          ),
        )
      )
    );
  }
}