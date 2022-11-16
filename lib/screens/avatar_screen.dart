import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avatar"),
        actions: [
          CircleAvatar(
            child: const Text("SL"),
            backgroundColor: Colors.indigo[900],
          )
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          maxRadius: 110,
          backgroundImage: NetworkImage("https://picsum.photos/200"),
        ),
      ),
    );
  }
}
