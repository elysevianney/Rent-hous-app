import 'package:location_app/export.dart';
import 'package:location_app/ressources/theme/app_theme.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int _currentPage = 0;
  PageController _controller = PageController();
  final List<Widget> _pages = [
    SliderPage(
        description:
        "Evitez de perdre beaucoup votre temps à chercher l’appartement idéal selon votre budget.",
        image: $AppAssets.svgs.onb1),
    SliderPage(
        description:
        "Découvrez les meilleurs appartements en fonction de vos moyens  et de l'emplacement idéal grâce à notre application",
        image: $AppAssets.svgs.onb2),
    SliderPage(
        description:
        "Poster des annonces pour proposer  votre appartement ou pour trouvez le partenaire de colocation",
        image: $AppAssets.svgs.onb3),
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),

            PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: _onChanged,
              itemBuilder: (context, int index) {
                return _pages[index];
              },
            ),
            Positioned(
                right: 0,
                top: 0,
                child: Container(

                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                  child:
                  AppButton(onTap: () {
                    context.push(
                        AppPage.dashboard.toPath);
                  },
                    width: 61,
                    height: 35,
                    backgroundColor: AppColors.primaryTwo.withOpacity(0.4),
                    widget: Text('Passer', style: AppTypography().regularAg12.copyWith(
                        color: AppColors.black
                    ),),
                  ),
                )
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:  const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List<Widget>.generate(_pages.length, (int index){
                            return AnimatedContainer(duration: Duration(milliseconds: 300),
                              margin: EdgeInsets.only(right: 5),
                              height: 10,
                              width: (index == _currentPage )? 24: 10,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: (index == _currentPage)
                                      ? AppColors.primaryTwo
                                      : AppColors.primaryTwo.withOpacity(0.4)
                              ),
                            );
                          })
                      ),
                      InkWell(
                        onTap: (){
                          _controller.nextPage(duration: Duration(milliseconds: 800), curve: Curves.easeInOutQuint);
                          if(_currentPage == 2){
                            context.pushReplacement(AppPage.getStarted.toPath);
                          }
                        },
                        child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColors.primaryTwo,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_right_alt_outlined,
                                color: Colors.white,
                                size: 28,
                              ),
                            )
                        ),
                      ),
                    ]
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}