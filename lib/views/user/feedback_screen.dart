part of '../views.dart';

class FeedbackScreen extends StatefulWidget {
  static const routeName = '/feedback';
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Feedback Screen'),
        ),
        body: const Center(
          child: Text(
            'Coming soon, Stranger. . .',
            style: TextStyle(fontSize: 32)
          ),
        ),
      ),
    );
  }
}