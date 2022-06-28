part of '../views.dart';

class ChartScreen extends StatefulWidget {
  static const routeName = '/chart';
  const ChartScreen({Key? key}) : super(key: key);

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
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