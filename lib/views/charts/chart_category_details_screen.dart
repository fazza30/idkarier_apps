part of '../views.dart';

class ChartCategoryDetailScreen extends StatefulWidget {
  static const routeName = '/chart_category_details';

  const ChartCategoryDetailScreen({
    Key? key,
    required this.graphic
  }) : super(key: key);

  final Graphics graphic;
  
  @override
  State<ChartCategoryDetailScreen> createState() => _ChartCategoryDetailScreenState();
}

class _ChartCategoryDetailScreenState extends State<ChartCategoryDetailScreen> {
  final categoryController = GraphicController();
  SurveyResponseModel surveyResponseModel = SurveyResponseModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: false,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.chevron_left,
              color: blackColor,
            ),
          ),
          title: Hero(
            tag: widget.graphic.idCategory,
            child: Text(
              widget.graphic.category,
              // 'GRAFIK PENILAIAN',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 22
              ),
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: AnimatedBuilder(
          animation: categoryController,
          builder: (context, _) {
            return ListView(
              children: widget.graphic.questions.map((qn) {
                return Card(
                  elevation: 10,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            // questions.questions,
                            qn,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16
                            ),
                            textAlign: TextAlign.center
                          ),
                          const Divider(
                            height: 30,
                            thickness: 1,
                          ),
                          PieChart(
                            dataMap: {
                              'Sangat Tidak Setuju': surveyResponseModel.veryBad.toDouble(),
                              'Tidak Setuju': surveyResponseModel.bad.toDouble(),
                              'Setuju': surveyResponseModel.good.toDouble(),
                              'Sangat Setuju': surveyResponseModel.veryGood.toDouble(),
                            },
                            chartRadius: MediaQuery.of(context).size.width,
                            legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.bottom,
                              showLegendsInRow: true
                            ),
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}