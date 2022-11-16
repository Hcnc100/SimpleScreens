import 'package:flutter/material.dart';
import 'package:screens/theme/app_theme.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cards"),
      ),
      body: const ListCards(),
    );
  }
}

class ListCards extends StatelessWidget {
  const ListCards({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return index == 0
            ? const CustomCardText()
            : CustomCardImage(
                urlImg: "https://picsum.photos/seed/picsum$index/500/200",
                title: "Imagen generica #$index");
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: 21,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    );
  }
}

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({Key? key, required this.urlImg, required this.title})
      : super(key: key);
  final String urlImg;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 30,
      shadowColor: AppTheme.primaryColor.withOpacity(0.5),
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(urlImg),
            placeholder: const AssetImage("assets/jar-loading.gif"),
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),
          Container(padding: const EdgeInsets.all(10), child: Text(title))
        ],
      ),
    );
  }
}

class CustomCardText extends StatelessWidget {
  const CustomCardText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          const ListTile(
            title: Text("Hola"),
            leading: Icon(Icons.ac_unit, color: AppTheme.primaryColor),
            subtitle: Text(
                "Qui commodo id minim ea. Aliquip consequat do ullamco excepteur officia velit cupidatat dolore ad minim. Nostrud ullamco fugiat sint voluptate excepteur occaecat irure nulla veniam elit fugiat aute. Nisi exercitation irure Lorem eu aute. Culpa aliquip proident et esse"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: const Text("Cancel")),
              TextButton(onPressed: () {}, child: const Text("Ok"))
            ],
          )
        ],
      ),
    );
  }
}
