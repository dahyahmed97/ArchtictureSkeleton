import 'package:archtictureskeletonsample/core/navigation/routes_catalog.dart';
import 'package:archtictureskeletonsample/features/auth/login/login_screen.dart';
import 'package:archtictureskeletonsample/features/auth/login/viewModel/login_screen_view_model.dart';
import 'package:archtictureskeletonsample/features/home/home_screen.dart';
import 'package:archtictureskeletonsample/features/home/viewModel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/login/models/login_response_model.dart';
import '../preferences/preferences_manager.dart';
import '../repo/repo.dart';

class AppRouter {
  IRepository repo;
  PreferenceManager preferencManager;

  AppRouter({required this.repo, required this.preferencManager});

  Route? generateRoute(RouteSettings settings) {
    //showLog("navigation", settings.name);

    if (settings.name != '/') {
      // FBAnalytics().sendScreen(settings.name);
    }

    switch (settings.name) {
      case RoutesCatalog.loginScreen:
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
              BlocProvider(
                  create: (_) => LoginScreenViewModel(repo, preferencManager)),
            ], child:  LoginScreen()));
      case RoutesCatalog.homeScreen:
        final arguments = settings.arguments as LoginResponseModel;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(providers: [
              BlocProvider(
                  create: (_) => HomeViewModel(repo, preferencManager)..onInit(arguments.id!)),
            ], child:  HomeScreen(userData:arguments)));



    }
    return null;
  }
}
