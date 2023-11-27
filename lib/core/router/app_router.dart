/*import 'dart:js';
*/
import 'package:location_app/ui/pages/MyPosts/MyPosts.dart';
import 'package:location_app/ui/pages/getStarted/getStarted.dart';
import 'package:flutter/cupertino.dart';
import 'package:location_app/export.dart';
import 'package:location_app/ui/pages/auth/login.dart';
import 'package:location_app/ui/pages/auth/singIn.dart';
import 'package:location_app/ui/pages/otherUserProfil/OtherUserProfil.dart';

import '../../ui/pages/Layout/layout.dart';
import '../../ui/pages/detailPostOfUser/detailPostOfUser.dart';
//import 'package:proxy_market/export.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  /// The route configuration.
  static final GoRouter _goRouter = GoRouter(
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: AppPage.splashScreen.toPath,
      errorBuilder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text(
              " Oups route error :)",
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
      routes: [
        GoRoute(
            path: '${AppPage.detailPostOfUser.toPath}/:username',
            name: AppPage.detailPostOfUser.toName,
            builder: (context, state){
              return DetailPostOfUser(username: state.pathParameters['username'].toString());
            }
        ),
        GoRoute(
            path: '${AppPage.myPosts.toPath}'/*/:otherUserId*/,
            name: AppPage.myPosts.toName,
            builder: (context, state){
              return MyPosts(/*otherUserId: 'Anaelle', state.pathParameters['username'].toString()*/);
            }
        ),
        GoRoute(
          path: '${AppPage.otherUserProfil.toPath}'/*/:otherUserId*/,
          name: AppPage.otherUserProfil.toName,
          builder: (context, state){
            return OtherUserProfil(otherUserId: 'Anaelle'/*state.pathParameters['username'].toString()*/);
          }
        ),
        GoRoute(
            path: '${AppPage.detailPost.toPath}/:username',
            name: AppPage.detailPost.toName,
            builder: (context, state){
              return DetatlPost(username: state.pathParameters['username'].toString());
            }
        ),
        GoRoute(
            path: '${AppPage.chatRoom.toPath}/:secondUserID',
            name: AppPage.chatRoom.toName,
            builder: (context, state){
              return ChatRoomView(secondUserID: state.pathParameters['secondUserID'].toString(),);
            }
        ),
        GoRoute(
          path: AppPage.newPost.toPath,
          name: AppPage.newPost.toName,
          builder: (context, state) {
            return const NewPost();
          },
        ),
        GoRoute(
          path: AppPage.paiementSbee.toPath,
          name: AppPage.paiementSbee.toName,
          builder: (context, state) {
            return const FormSbee();
          },
        ),
        GoRoute(
          path: AppPage.successPaiementSbee.toPath,
          name: AppPage.successPaiementSbee.toName,
          builder: (context, state) {
            return const SbeeSuccessPage();
          },
        ),
        GoRoute(
          path: AppPage.splashScreen.toPath,
          name: AppPage.splashScreen.toName,
          builder: (context, state) {
            return const SplashScreen();
          },
        ),
        GoRoute(
          path: AppPage.getStarted.toPath,
          name: AppPage.getStarted.toName,
          builder: (context, state) {
            return const GetStarted();
          },
        ),
        GoRoute(
          path: AppPage.onBoarding.toPath,
          name: AppPage.onBoarding.toName,
          builder: (context, state) {
            return const OnBoarding();
          },
        ),
        GoRoute(
          path: AppPage.dashboard.toPath,
          name: AppPage.dashboard.toName,
          builder: (context, state) {
            return layout();
          },
        ),
        GoRoute(
          path: AppPage.signIn.toPath,
          name: AppPage.signIn.toName,
          builder: (context, state) {
            return SignIn();
          },
        ),
        GoRoute(
          path: AppPage.login.toPath,
          name: AppPage.login.toName,
          builder: (context, state) {
            return Login();
          },
        ),
        /*
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return child;
            },
            routes: [
              GoRoute(
                  path: AppPage.dashboard.toPath,
                  name: AppPage.dashboard.toName,
                  builder: (context, state) => const ScaffoldCustom(),
                  routes: [
                    GoRoute(
                      path: "home",
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: HomeScreen()),
                      routes: [
                        GoRoute(
                            path: "packdetails",
                            name: "/packdetails",
                            pageBuilder: (context, state) =>
                            const NoTransitionPage(child: PackDescription()),
                            routes: [

                            ]),

                      ]
                    ),
                    GoRoute(
                      path: "favors",
                      pageBuilder: (context, state) =>
                          const NoTransitionPage(child: FavorsScreen()),
                    ),

                  ]),
            ]),
        */

      ]);

  static GoRouter get router => _goRouter;
}
