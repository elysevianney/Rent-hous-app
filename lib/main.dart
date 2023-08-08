import 'package:location_app/ressources/theme/theme.dart';

import 'export.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(375.0, 812.0),
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            // // supportedLocales:const [Locale("fr", "FR"),],
            localizationsDelegates:  const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('en'),
              Locale('fr'),
            ],
            debugShowCheckedModeBanner: false,
            routeInformationProvider: AppRouter.router.routeInformationProvider,
            routeInformationParser: AppRouter.router.routeInformationParser,
            routerDelegate: AppRouter.router.routerDelegate,
            themeMode: ThemeMode.light,
            theme: AppThemData().toThemeData(),
          );
        },
      ),
    );
  }
}