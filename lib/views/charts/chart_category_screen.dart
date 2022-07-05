part of '../views.dart';

class ChartCategoryScreen extends StatefulWidget {
  static const routeName = '/chart_category';
  const ChartCategoryScreen({Key? key}) : super(key: key);

  @override
  State<ChartCategoryScreen> createState() => _ChartCategoryScreenState();
}

class _ChartCategoryScreenState extends State<ChartCategoryScreen> {
  final categoryController = GraphicController();

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
          title: Text(
            'KATEGORI',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontSize: 22
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: AnimatedBuilder(
          animation: categoryController,
          builder: (context, _) {
            return LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return Stack(
                  children: [
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 500),
                      child: ListView.builder(
                        itemCount: graphicList.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => CategoryCard(
                          category: graphicList[index],
                          press: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder: (context, animation, secondaryAnimation) => (
                                  SizeTransition(
                                    sizeFactor: animation,
                                    child: ChartCategoryDetailScreen(
                                      graphic: graphicList[index],
                                    ),
                                    axisAlignment: 0.0,
                                  )
                                ),
                              )
                            );
                          },
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Graphics category;
  final VoidCallback press;

  const CategoryCard({
    Key? key,
    required this.category,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Center(
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 5, 0, 5),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: 100,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 30),
                  child: Image(
                    image: AssetImage(category.imagePath),
                    width: 40,
                  ),
                ),
                Container(
                  width: 0.5,
                  color: backgroundColor,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 20),
                  child: Hero(
                    tag: category.idCategory,
                    child: Text(
                      category.category,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: textButtonColor,
                        fontSize: 15
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}