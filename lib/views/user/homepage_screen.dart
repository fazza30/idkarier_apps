part of '../views.dart';

class HomepageScreen extends StatefulWidget {
  static const routeName = '/homepage';
  const HomepageScreen({Key? key}) : super(key: key);

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  // Initialized for SharedPreferences item
  String? user, username;
  ProfileController profileController = ProfileController();

  CategoryController categoryController = CategoryController();
  late Future<List<CategoryModel>> listData;

  @override
  void initState() {
    super.initState(); 
    listData = categoryController.showAllCategory();
    getCredentials();
  }

  // Collect data from login state
  void getCredentials() async {
    SharedPreferences? pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('username');
      getProfile();
    });
  }

  // Get profile data
  void getProfile() async {
    var response = await http.get(
      Uri.parse(apiGetProfile + '$username'),
      headers: {
        "Accept": "application/json"
      }
    );
    if (response.statusCode == 200) {
      print("Code status: " + response.statusCode.toString());
      print(response.body);
      var data = jsonDecode(response.body);
      setState(() {
        username = data['firstname'].toString();
      });
    } else {
      print("Code status: " + response.statusCode.toString());
      return null;
    }
  }

  // Logout condition
  void logout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Stack(
              children: [
                backgroundImage(),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30, 10, 30, 0),
                  child: screenHeader(),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(30, 60, 30, 0),
                  child: jumbotron(),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Mandatory',
                        style: Theme.of(context).textTheme.headline6
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: categoryGridView(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Background image widget
  backgroundImage() {
    return Container(
      width: double.infinity,
      height: 110,
      decoration: const BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(45),
          bottomRight: Radius.circular(45),
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        child: SvgPicture.asset(
          'assets/images/jumbotron_bg.svg',
          width: double.infinity,
          height: 100,
          fit: BoxFit.fill,
        ),
      ),
    ); 
  }

  // Header widget
  screenHeader() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Profile picture
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
              child: InkWell(
                // Profile Screen
                onTap: () {
                  Navigator.of(context).pushNamed('/profile');
                },
                child: Container(
                  width: 40,
                  height: 40,
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle
                  ),
                  child: Image.asset(
                    'assets/images/logo-uin.png'
                  ),
                ),
              ),
            ),
            // Profile Screen + User Name
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed('/profile');
              },
              child: Text(
                'Hai, $username !',
                style: const TextStyle(
                  color: textButtonColor,
                  fontSize: 18
                )
              ),
            )
          ],
        ),
        // Action Button
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Notification
            GestureDetector(
              onTap: () async {
                Navigator.of(context).pushNamed('/chart_category');
              },
              child: const Icon(
                Icons.bar_chart_outlined,
                size: 30,
                color: whiteIconColor
              )
            ),
            // Logout
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
              child: GestureDetector(
                onTap: () async {
                  // Show popup before logout
                  await showDialog(
                      context: context,
                      builder: (alertDialogContext) {
                        return AlertDialog(
                          title: const Text('Peringatan'),
                          content: const Text('Ingin logout ?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(
                                  alertDialogContext),
                              child: const Text('Batal'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(alertDialogContext);
                                // Function for logouting account
                                logout();
                                await Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/login',
                                  (Route<dynamic> route) => false
                                );
                              },
                              child: const Text('Ya'),
                            ),
                          ],
                        );
                      },
                    );
                },
                child: const Icon(
                  Icons.logout,
                  size: 30,
                  color: whiteIconColor,
                )
              ),
            )
          ],
        )
      ],
    );
  }

  // Jumbotron widget
  jumbotron() {
    return Material(
      color: transparent,
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/logo-uin.png',
              width: 100,
              fit: BoxFit.cover,
            ),
            Image.asset(
              'assets/images/pusat-karir-uin.png',
              height: 60,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  categoryGridView() {
    return FutureBuilder<List<CategoryModel>>(
      future: listData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<CategoryModel> isiData = snapshot.data!;
          return Container(
            height: 250,
            // decoration: BoxDecoration(
            //   border: Border.all()
            // ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2/2
              ),
              itemCount: isiData.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/quiz');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.people,
                          size: 30,
                          color: whiteIconColor,
                        ),
                        Text(
                          isiData[index].category,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: textButtonColor
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}