// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../Ui/dashboard/dashboard_view.dart';
import '../Ui/login/login_view.dart';
import '../Ui/splash/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String dashBoardView = '/dash-board-view';
  static const String loginView = '/login-view';
  static const all = <String>{
    splashView,
    dashBoardView,
    loginView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.dashBoardView, page: DashBoardView),
    RouteDef(Routes.loginView, page: LoginView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    DashBoardView: (data) {
      var args = data.getArgs<DashBoardViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => DashBoardView(
          key: args.key,
          name: args.name,
        ),
        settings: data,
      );
    },
    LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// DashBoardView arguments holder class
class DashBoardViewArguments {
  final Key? key;
  final String name;
  DashBoardViewArguments({this.key, required this.name});
}
