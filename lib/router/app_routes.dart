import 'package:flutter/material.dart';
import 'package:screens/models/destination.dart';
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
        route: "list1",
        icon: Icons.home,
        name: "home",
        screen: const ListAllScreen()),
    Destination(
        route: "list2",
        icon: Icons.home,
        name: "home",
        screen: const ListAllScreen()),
    Destination(
        route: "list3",
        icon: Icons.home,
        name: "home",
        screen: const ListAllScreen())
  ];

  static Map<String, Widget Function(BuildContext)> get routers {
    return {
      for (var element in listDestinations)
        element.route: (BuildContext context) => element.screen
    };
  }
}
