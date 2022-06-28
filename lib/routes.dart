import 'package:flutter/material.dart';
import 'package:idkarier_uinjkt/views/views.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case WelcomeScreen.routeName:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => RegisterScreen());

      case ForgotPassword.routeName:
        return MaterialPageRoute(builder: (_) => ForgotPassword());

      case HomepageScreen.routeName:
        return MaterialPageRoute(builder: (_) => HomepageScreen());

      case ChartCategoryScreen.routeName:
        return MaterialPageRoute(builder: (_) => ChartCategoryScreen());

      case ChartCategoryDetailScreen.routeName:
        return MaterialPageRoute(builder: (_) => ChartCategoryDetailScreen());

      case ChartScreen.routeName:
        return MaterialPageRoute(builder: (_) => ChartScreen());

      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      case QuizScreen.routeName:
        return MaterialPageRoute(builder: (_) => QuizScreen());

      case FeedbackScreen.routeName:
        return MaterialPageRoute(builder: (_) => FeedbackScreen());
      
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text(
            'Sorry, your page currently is not available',
            style: TextStyle(fontSize: 32)
          ),
        ),
      );
    });
  } 
}