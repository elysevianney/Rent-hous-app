import 'dart:async';

import 'package:location_app/export.dart';

import '../../../export.dart';

class DashboardProvider extends ChangeNotifier {
  int get index => _index;
  setIndex(index) {
    _index = index;
    notifyListeners();
  }
  int _index = 0;

  bool _isreturn = false;
  bool get isreturn => _isreturn;
  setIsReturn(bool) {
    _isreturn = bool;
    notifyListeners();
  }

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  GlobalKey<CurvedNavigationBarState> get keyy => _bottomNavigationKey;
  setEtat (index){
    final CurvedNavigationBarState? navBarState =
        _bottomNavigationKey.currentState;
    navBarState?.setPage(index);
    notifyListeners();
  }

  //variable for page view
  /*late Timer timer;
  int _activePage = 0;
  late PageController _pageController;
  PageController get pageController => _pageController;
  int get activePage => _activePage;

  // end variable for page view
  AppPage get path => _path;
  AppPage _path = AppPage.dashboard;

  DashboardProvider() {
    _pageController =
        PageController(viewportFraction: 1, initialPage: activePage);
    // startAutoScroll();
  }

  startAutoScroll() {
    timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_activePage < 2) {
        _activePage++;
      } else {
        _activePage = 0;
      }
      pageController.animateToPage(
        activePage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
    notifyListeners();
  }

  setActivePage(int activePage) {
    _activePage = activePage;
    notifyListeners();
  }

  setIndex(index) {
    _index = index;
    notifyListeners();
  }

  setPath(path) {
    _path = path;
    notifyListeners();
  }

  List<Widget> listPage = [
    const HomeScreen(),
    const PackDescription(),
    const Center(child: Text("Favors")),
    const Center(child: Text("Search")),
    const Center(child: Text("Account")),


  ];
  */
}
