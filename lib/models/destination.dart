import 'package:flutter/material.dart' show IconData, Widget;

class Destination {
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  Destination(
      {required this.route,
      required this.icon,
      required this.name,
      required this.screen});
}
