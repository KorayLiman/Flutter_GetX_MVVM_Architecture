import 'package:flutter/material.dart';

import '../../pages/general/home/view/home_view.dart';
import '../../pages/splash/view/splash_view.dart';
import '../constants/navigation_constants.dart';

extension NavigationConstantsExtension on NavigationConstants {
  String get pageName => "/$name";
  Widget get pageWidget => switch (this) {
        NavigationConstants.splash => Splash(),
        NavigationConstants.home => Home(),
      };
}
