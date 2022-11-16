import 'package:flutter/material.dart';
import 'package:screens/models/destination.dart';
import 'package:screens/screens/animation_screen.dart';
import 'package:screens/screens/avatar_screen.dart';
import 'package:screens/screens/screens.dart';

class AppRouters {
  static const initialRoute = "home";
  static final listDestinations = <Destination>[
    Destination(
        route: "home",
        icon: Icons.home,
        name: "home",
        screen: const ListAllScreen()),
    Destination(
        route: "card",
        icon: Icons.home,
        name: "CardScreen",
        screen: const CardScreen()),
    Destination(
        route: "alert",
        icon: Icons.home,
        name: "AlertScreen",
        screen: const AlertScreen()),
    Destination(
        route: "avatar",
        icon: Icons.home,
        name: "AvatarScreen",
        screen: const AvatarScreen()),
    Destination(
        route: "animation",
        icon: Icons.home,
        name: "AnimationScreen",
        screen: const AnimationScreen())
  ];

  static Map<String, Widget Function(BuildContext)> get routers {
    return {
      for (var element in listDestinations)
        element.route: (BuildContext context) => element.screen
    };
  }
}
