import 'package:flutter/material.dart';
import 'package:screens/models/destination.dart';
import 'package:screens/router/app_routes.dart';
import 'package:screens/theme/app_theme.dart';

class ListAllScreen extends StatelessWidget {
  const ListAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LIsta de pantallas"),
      ),
      body: ListScreens(listDestinations: AppRouters.listDestinations),
    );
  }
}

class ListScreens extends StatelessWidget {
  const ListScreens({Key? key, required this.listDestinations})
      : super(key: key);

  final List<Destination> listDestinations;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: listDestinations.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, int index) =>
          ItemNav(destination: listDestinations[index]),
    );
  }
}

class ItemNav extends StatelessWidget {
  const ItemNav({
    Key? key,
    required this.destination,
  }) : super(key: key);

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(destination.name),
      onTap: () => Navigator.pushNamed(context, destination.route),
      leading: Icon(destination.icon, color: AppTheme.primaryColor),
      trailing: const Icon(Icons.arrow_forward_rounded),
    );
  }
}
