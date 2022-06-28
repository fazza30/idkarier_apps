part of '../views.dart';

class ChartCategoryDetailScreen extends StatefulWidget {
  static const routeName = '/chart_category_details';
  const ChartCategoryDetailScreen({Key? key}) : super(key: key);

  @override
  State<ChartCategoryDetailScreen> createState() => _ChartCategoryDetailScreenState();
}

class _ChartCategoryDetailScreenState extends State<ChartCategoryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart Details Screen'),
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