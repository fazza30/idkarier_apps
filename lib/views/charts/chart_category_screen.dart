part of '../views.dart';

class ChartCategoryScreen extends StatefulWidget {
  static const routeName = '/chart_category';
  const ChartCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ChartCategoryScreen> createState() => _ChartCategoryScreenState();
}

class _ChartCategoryScreenState extends State<ChartCategoryScreen> {
  late QuizController engine;
  

  @override
  void initState() {
    super.initState(); 
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart Screen'),
      ),
      body: const Center(
        child: Text(
          'Coming soon, Stranger. . .',
          style: TextStyle(fontSize: 32)
        ),
      ),
    );
  }
}
