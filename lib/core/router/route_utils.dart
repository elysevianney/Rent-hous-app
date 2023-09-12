enum AppPage {
  splashScreen,
  getStarted,
  onBoarding,
  homePage,
  searchProduct,
  dashboard,
  signIn,
  login,
  detailPost,
  paiementSbee,
  successPaiementSbee,
  newPost,
  chatRoom,
  otherUserProfil,
  myPosts,
  detailPostOfUser
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.detailPost:
        return "/detailPost";
      case AppPage.detailPostOfUser:
        return "/detailPostOfUser";
      case AppPage.myPosts:
        return "/myPosts";
      case AppPage.otherUserProfil:
        return "/otherUserProfil";
      case AppPage.newPost:
        return "/newPost";
      case AppPage.chatRoom:
        return "/chatRoom";
      case AppPage.paiementSbee:
        return "/paiementSbee";
      case AppPage.successPaiementSbee:
        return "/successPaiementSbee";
      case AppPage.getStarted:
        return "/getStarted";
      case AppPage.splashScreen:
        return "/splashScreen";
      case AppPage.onBoarding:
        return "/onBoarding";
      case AppPage.homePage:
        return "/homePage";
      case AppPage.searchProduct:
        return "/searchProduct";
      case AppPage.dashboard:
        return "/dashboard";
      case AppPage.signIn:
        return "/signIn";
      case AppPage.login:
        return "/login";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case AppPage.myPosts:
        return "MYPOSTS";
      case AppPage.splashScreen:
        return "DETAILPRODUCT";
      case AppPage.detailPostOfUser:
        return "DETAILPOSTOFUSER";
      case AppPage.otherUserProfil:
        return "OTHERUSERPROFIL";
      case AppPage.chatRoom:
        return "CHATROOM";
      case AppPage.newPost:
        return "NEWPOST";
      case AppPage.paiementSbee:
        return "PAIEMENTSBEE";
      case AppPage.detailPost:
        return "DETAILPOST";
      case AppPage.successPaiementSbee:
        return "SUCCESSPAIEMENTSBEE";
      case AppPage.getStarted:
        return "GETSARTED";
      case AppPage.splashScreen:
        return "SPLASHSCREEN";
      case AppPage.onBoarding:
        return "ONBOARDING";
      case AppPage.homePage:
        return "HOMEPAGE";
      case AppPage.searchProduct:
        return "SEARCHPRODUCT";
      case AppPage.dashboard:
        return "DASHBOARD";
      case AppPage.signIn:
        return "/SIGNIN";
      case AppPage.login:
        return "/LOGIN";
      default:
        return "HOME";
    }
  }
}
