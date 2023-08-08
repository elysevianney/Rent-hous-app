import 'package:location_app/core/provider/bottomNavigation/navigator_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/controllers/auth/auth_controller.dart';
import 'core/provider/bottomNavigation/navigator_provider.dart';
import 'core/provider/favorsProvider.dart';
import 'core/provider/validator/inscription_provider.dart';


// global providers
class ProviderScope extends StatelessWidget {
  const ProviderScope({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavorsProvider>(create: (_) => FavorsProvider(0)),
        ChangeNotifierProvider<DashboardProvider>(create: (_) => DashboardProvider()),
        ChangeNotifierProvider<ValidatorProvider>(
            create: (_) => ValidatorProvider()),
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
      ],
      child: child,
    );
  }
}
