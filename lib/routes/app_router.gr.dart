// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../screens/confirmation_code_screen.dart' as _i2;
import '../screens/first_screen.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    FirstRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.FirstScreen());
    },
    ConfimationCodeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.ConfimationCodeScreen());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(FirstRoute.name, path: '/'),
        _i3.RouteConfig(ConfimationCodeRoute.name, path: '/confirmation')
      ];
}

/// generated route for
/// [_i1.FirstScreen]
class FirstRoute extends _i3.PageRouteInfo<void> {
  const FirstRoute() : super(FirstRoute.name, path: '/');

  static const String name = 'FirstRoute';
}

/// generated route for
/// [_i2.ConfimationCodeScreen]
class ConfimationCodeRoute extends _i3.PageRouteInfo<void> {
  const ConfimationCodeRoute()
      : super(ConfimationCodeRoute.name, path: '/confirmation');

  static const String name = 'ConfimationCodeRoute';
}
