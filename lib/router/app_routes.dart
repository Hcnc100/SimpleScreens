import 'package:flutter/material.dart';
import 'package:screens/models/destination.dart';
import 'package:screens/screens/screens.dart';

class AppRouters {
  static const initialRoute = "home";
  static final listDestinations = <Destination>[
    Destination(
        route: "card",
        icon: Icons.card_giftcard,
        name: "CardScreen",
        screen: const CardScreen()),
    Destination(
        route: "alert",
        icon: Icons.notification_add,
        name: "AlertScreen",
        screen: const AlertScreen()),
    Destination(
        route: "avatar",
        icon: Icons.person,
        name: "AvatarScreen",
        screen: const AvatarScreen()),
    Destination(
        route: "animation",
        icon: Icons.animation,
        name: "AnimationScreen",
        screen: const AnimationScreen()),
    Destination(
        route: "inputs",
        icon: Icons.input,
        name: "InputsScreen",
        screen: const InputsScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> get routers {
    final mapRoutes = {
      for (var element in listDestinations)
        element.route: (BuildContext context) => element.screen
    };

    // ! add home screen
    mapRoutes.addAll({"home": (BuildContext context) => const HomeScreen()});

    return mapRoutes;
  }
}
